import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/text_styles.dart';
import '../providers/auth_provider.dart';
import '../widgets/starry_night_background.dart';
import '../i18n/translations.g.dart';
import '../services/apple_store_service.dart';
import '../services/stripe_service.dart';
import '../services/api_client.dart' show ApiException;
import '../services/subscription_service.dart';
import '../services/loopback_server.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../utils/auth_navigation_utils.dart';
import '../models/subscription_plan.dart';
import '../models/subscription.dart';
import '../widgets/subscription_card.dart' show managedElsewhereMessage;
import '../widgets/subscription/subscription_button.dart';
import '../widgets/subscription/trial_info_container.dart';
import '../widgets/subscription/price_display.dart';
import '../widgets/subscription/plan_features.dart';
import '../widgets/subscription/plan_badge.dart';
import '../widgets/subscription/renewal_date_display.dart';

class SubscriptionPlansScreen extends StatefulWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  State<SubscriptionPlansScreen> createState() =>
      _SubscriptionPlansScreenState();
}

class _SubscriptionPlansScreenState extends State<SubscriptionPlansScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showAllPlans = false;
  bool _hasTrialEligibility = true;
  bool _isLoadingTrialEligibility = true;
  SubscriptionStatusResponse? _subscriptionStatus;
  StripeConfig? _stripeConfig;
  List<ProductDetails>? _appleProducts;
  bool _isLoadingStoreData = true;
  final bool _usesAppleStore = AppleStoreService.isAvailable;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    ); // Start with monthly when showing all plans

    // Add listener to rebuild when tab changes
    _tabController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _loadStoreData();
    _loadSubscriptionStatus();
    _checkForSessionId();
  }

  Future<void> _loadStoreData() async {
    try {
      if (_usesAppleStore) {
        final products = await AppleStoreService.instance.loadProducts();
        final trialEligible = await AppleStoreService.instance
            .isTrialEligible();
        if (mounted) {
          setState(() {
            _appleProducts = products;
            _hasTrialEligibility = trialEligible;
          });
        }
      } else {
        final config = await StripeService.getConfig();
        if (mounted) {
          setState(() => _stripeConfig = config);
        }
      }
    } catch (e) {
      debugPrint('Failed to load store data: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoadingStoreData = false);
      }
    }
  }

  bool get _storeDataLoaded =>
      _usesAppleStore ? _appleProducts != null : _stripeConfig != null;

  Future<void> _loadSubscriptionStatus() async {
    try {
      final subscriptionService = SubscriptionService(context: context);
      final status = await subscriptionService.getSubscriptionStatus();

      if (mounted) {
        setState(() {
          _subscriptionStatus = status;
          if (!_usesAppleStore) {
            _hasTrialEligibility = status.hasTrialEligibility;
          }
          _isLoadingTrialEligibility = false;
        });
      }
    } catch (e) {
      // On error, default to showing trial (better UX)
      if (mounted) {
        setState(() {
          if (!_usesAppleStore) {
            _hasTrialEligibility = true;
          }
          _isLoadingTrialEligibility = false;
        });
      }
    }
  }

  Future<void> _checkForSessionId() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final uri = Uri.base;
      final sessionId = uri.queryParameters['session_id'];

      if (sessionId != null && sessionId.isNotEmpty) {
        // Show loading while confirming session
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        Translations.of(context).ui.confirmingSubscription,
                        style: AppTextStyles.getBodyStyle(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        try {
          final tier = await StripeService.confirmSession(context, sessionId);
          if (mounted) {
            Navigator.of(context).pop();
            context.go('/subscription-success?tier=$tier');
          }
        } catch (e) {
          if (mounted) {
            // Close loading dialog if still showing
            Navigator.of(context).pop();

            SnackbarUtils.showCopyableErrorSnackBar(
              context,
              e is ApiException && e.message.isNotEmpty
                  ? e.message
                  : Translations.of(context).ui.subscriptionConfirmationFailed,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String? _getButtonLabel(SubscriptionPlan plan, Translations t) {
    if (_subscriptionStatus?.hasActiveSubscription ?? false) {
      return t.ui.changePlan;
    }

    return null;
  }

  void _handleManageSubscription(
    BuildContext context, {
    String? priceId,
  }) async {
    if (_subscriptionStatus!.subscription!.isApple) {
      await AppleStoreService.instance.openManageSubscriptions();
      return;
    }
    try {
      final subscriptionService = SubscriptionService(context: context);
      await subscriptionService.openCustomerPortal(priceId: priceId);
    } on ApiException catch (e) {
      if (context.mounted) {
        SessionUtils.handleApiException(
          context,
          e,
          (message) => SnackbarUtils.showError(context, message),
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showError(
          context,
          Translations.of(context).ui.errorOpeningUrl,
        );
      }
    }
  }

  void _handlePlanAction(BuildContext context, SubscriptionPlan plan) async {
    final hasActiveSubscription =
        _subscriptionStatus?.hasActiveSubscription ?? false;
    if (_usesAppleStore &&
        (!hasActiveSubscription ||
            _subscriptionStatus!.subscription!.isApple)) {
      _handleApplePurchase(context, plan);
    } else if (hasActiveSubscription) {
      _handleManageSubscription(context, priceId: plan.priceId);
    } else {
      _handleStripeCheckout(context, plan);
    }
  }

  bool _requireLogin(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isAuthenticated) {
      return false;
    }
    unawaited(saveReturnUrl('/subscription-plans'));
    SnackbarUtils.showInfo(
      context,
      Translations.of(context).ui.loginRequiredForSubscription,
    );
    context.go('/login');
    return true;
  }

  Future<void> _handleApplePurchase(
    BuildContext context,
    SubscriptionPlan plan,
  ) async {
    if (_requireLogin(context)) return;
    final product = _appleProducts!.firstWhere((p) => p.id == plan.priceId);
    final result = AppleStoreService.instance.results.first;
    try {
      await AppleStoreService.instance.buy(product);
    } on PlatformException catch (e) {
      if (context.mounted) {
        SnackbarUtils.showError(context, e.message!);
      }
      return;
    }
    final outcome = await result;
    if (context.mounted) {
      _showApplePurchaseResult(context, outcome);
    }
  }

  Future<void> _handleRestorePurchases(BuildContext context) async {
    if (_requireLogin(context)) return;
    final t = Translations.of(context);
    final result = AppleStoreService.instance.results.first.timeout(
      const Duration(seconds: 15),
    );
    await AppleStoreService.instance.restore();
    try {
      final restored = await result;
      if (context.mounted) {
        _showApplePurchaseResult(context, restored);
      }
    } on TimeoutException {
      if (context.mounted) {
        SnackbarUtils.showInfo(context, t.ui.noPurchasesToRestore);
      }
    }
  }

  void _showApplePurchaseResult(
    BuildContext context,
    ApplePurchaseResult result,
  ) {
    switch (result) {
      case ApplePurchaseCompleted(:final tier):
        context.go('/subscription-success?tier=$tier');
      case ApplePurchaseFailed(:final serverMessage):
        SnackbarUtils.showError(
          context,
          serverMessage ??
              Translations.of(context).legal.paymentProcessingError,
        );
      case ApplePurchaseCancelled():
        return;
    }
  }

  void _handleStripeCheckout(
    BuildContext context,
    SubscriptionPlan plan,
  ) async {
    final t = Translations.of(context);

    if (_requireLogin(context)) return;

    var loadingShown = false;
    void hideLoading() {
      if (loadingShown && context.mounted) {
        Navigator.of(context).pop();
        loadingShown = false;
      }
    }

    try {
      loadingShown = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Get the correct price ID from plan
      final String priceId = plan.priceId;

      final isDesktop =
          !kIsWeb &&
          (defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.windows);

      final useCheckoutSession = kIsWeb || isDesktop;

      if (useCheckoutSession) {
        LoopbackServer? server;
        String? successUrl;
        String? cancelUrl;

        if (isDesktop) {
          server = LoopbackServer(
            title: t.ui.portalReturnTitle,
            message: t.ui.portalReturnMessage,
            cancelledTitle: t.ui.checkoutCancelledTitle,
            cancelledMessage: t.ui.checkoutCancelledMessage,
          );
          final baseUrl = await server.start();
          successUrl = baseUrl;
          cancelUrl = '$baseUrl?cancelled=true';
        }

        if (!context.mounted) return;

        final response = await StripeService.createCheckoutSession(
          context,
          priceId,
          successUrl: successUrl,
          cancelUrl: cancelUrl,
        );

        final checkoutUrl = response['checkout_url'] as String?;

        hideLoading();

        if (checkoutUrl == null) {
          await server?.close();
          throw Exception('No checkout URL received');
        }

        if (isDesktop && server != null) {
          final uri = Uri.parse(checkoutUrl);
          final launched = await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
          if (!launched) {
            await server.close();
            throw Exception('Cannot open URL');
          }

          final params = await server.waitForCallbackWithParams();
          final sessionId = params['session_id'];
          final cancelled = params['cancelled'] == 'true';
          final timedOut = params['timeout'] == 'true';

          if (cancelled || timedOut) {
            return;
          }

          if (sessionId != null && context.mounted) {
            final tier = await StripeService.confirmSession(context, sessionId);
            if (context.mounted) {
              context.go('/subscription-success?tier=$tier');
            }
          }
        } else {
          await StripeService.launchStripeCheckout(checkoutUrl);
        }
      } else {
        final setupData = await StripeService.createPaymentIntent(
          context,
          priceId,
        );

        await StripeService.initPaymentSheet(
          setupIntentClientSecret: setupData['setup_intent'],
          customerId: setupData['customer_id'],
          customerEphemeralKeySecret: setupData['ephemeral_key'],
        );

        hideLoading();

        await StripeService.presentPaymentSheet();

        // Setup successful, now create subscription with trial
        if (context.mounted) {
          await StripeService.createSubscriptionFromSetup(
            context: context,
            customerId: setupData['customer_id'],
            priceId: setupData['price_id'],
          );
        }

        // Subscription created, navigate to success page
        if (context.mounted) {
          final tier = plan.isPremium ? 'premium' : 'standard';
          context.go('/subscription-success?tier=$tier');
        }
      }
    } on ApiException catch (e) {
      hideLoading();
      if (context.mounted) {
        // Check if this is the "already subscribed" error using errorKey
        if (e.errorKey == 'subscription.already_exists') {
          SnackbarUtils.showErrorWithAction(
            context,
            e.message,
            t.ui.manageSubscription,
            () => context.push('/settings'),
          );
        } else {
          SessionUtils.handleApiException(
            context,
            e,
            (message) => SnackbarUtils.showError(context, message),
          );
        }
      }
    } on CheckoutException catch (e) {
      hideLoading();
      if (context.mounted) {
        if (e.message.contains('cancelled')) {
          return;
        }
        SnackbarUtils.showError(context, e.message);
      }
    } catch (e) {
      hideLoading();
      if (context.mounted) {
        SnackbarUtils.showError(context, t.legal.paymentProcessingError);
      }
    }
  }

  List<SubscriptionPlan> _getAllPlans() {
    final t = Translations.of(context);
    if (_usesAppleStore) {
      return SubscriptionPlan.getApplePlans(t, _appleProducts!);
    }
    final config = _stripeConfig!;
    return [
      ...SubscriptionPlan.getMonthlyPlans(t, config),
      ...SubscriptionPlan.getSemiannualPlans(t, config),
      ...SubscriptionPlan.getAnnualPlans(t, config),
    ];
  }

  List<SubscriptionPlan> _getCurrentPlans() {
    final selectedType = PlanType.values[_tabController.index];
    final allPlans = _getAllPlans();
    final plans = allPlans.where((plan) => plan.type == selectedType).toList();

    final annotatedAllPlans = SubscriptionPlan.annotateWithCurrentPlan(
      allPlans,
      _subscriptionStatus?.subscription,
    );

    final annotatedPlans = plans.map((plan) {
      final matchingPlan = annotatedAllPlans.firstWhere(
        (p) => p.priceId == plan.priceId,
        orElse: () => plan,
      );
      return plan.copyWith(
        badge: matchingPlan.badge,
        isCurrentPlan: matchingPlan.isCurrentPlan,
        nextRenewalDate: matchingPlan.nextRenewalDate,
        cancelAtPeriodEnd: matchingPlan.cancelAtPeriodEnd,
      );
    }).toList();

    return SubscriptionPlan.sortByPriority(annotatedPlans);
  }

  List<SubscriptionPlan> _getSimplifiedPlans() {
    final t = Translations.of(context);
    final allPlans = _getAllPlans();
    final plans = _usesAppleStore
        ? [
            _premiumPlan(
              allPlans,
              PlanType.annual,
            ).copyWith(cardStyle: CardStyle.main),
            _premiumPlan(
              allPlans,
              PlanType.monthly,
            ).copyWith(cardStyle: CardStyle.alternative),
          ]
        : SubscriptionPlan.getSimplifiedPlans(t, _stripeConfig!);

    final annotatedAllPlans = SubscriptionPlan.annotateWithCurrentPlan(
      allPlans,
      _subscriptionStatus?.subscription,
    );

    final annotatedPlans = plans.map((plan) {
      final matchingPlan = annotatedAllPlans.firstWhere(
        (p) => p.priceId == plan.priceId,
        orElse: () => plan,
      );
      return plan.copyWith(
        badge: matchingPlan.badge,
        isCurrentPlan: matchingPlan.isCurrentPlan,
        nextRenewalDate: matchingPlan.nextRenewalDate,
        cancelAtPeriodEnd: matchingPlan.cancelAtPeriodEnd,
      );
    }).toList();

    return SubscriptionPlan.sortByPriority(annotatedPlans);
  }

  bool get _subscriptionManagedElsewhere =>
      _usesAppleStore &&
      (_subscriptionStatus?.hasActiveSubscription ?? false) &&
      !_subscriptionStatus!.subscription!.isApple;

  SubscriptionPlan _premiumPlan(List<SubscriptionPlan> plans, PlanType type) =>
      plans.firstWhere(
        (plan) => plan.tier == PlanTier.premium && plan.type == type,
      );

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: true,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(t.ui.viewPlans),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
              ),
              Expanded(
                child: _isLoadingTrialEligibility || _isLoadingStoreData
                    ? const Center(child: CircularProgressIndicator())
                    : !_storeDataLoaded
                    ? Center(
                        child: Text(
                          t.ui.connectionError,
                          style: AppTextStyles.getBodyStyle(context),
                        ),
                      )
                    : SingleChildScrollView(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: MediaQuery.of(context).padding.bottom + 16,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight:
                                MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                kToolbarHeight -
                                32,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                t.about.chooseAstrologicalPath,
                                style: AppTextStyles.getH2Style(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              if (_showAllPlans) ...[
                                _buildTabSelector(),
                                const SizedBox(height: 24),
                                _buildTabContent(t),
                                const SizedBox(height: 16),
                                Center(
                                  child: FilledButton.tonal(
                                    onPressed: () {
                                      setState(() {
                                        _showAllPlans = false;
                                      });
                                    },
                                    style: FilledButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          t.ui.hideOtherPlans,
                                          style: AppTextStyles.getBodyStyle(
                                            context,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.expand_less, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ] else ...[
                                _buildSimplifiedLayout(),
                              ],
                              const SizedBox(height: 24),
                              _buildPurchaseFooter(t),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseFooter(Translations t) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_usesAppleStore) ...[
              TextButton(
                onPressed: () => _handleRestorePurchases(context),
                child: Text(t.ui.restorePurchases),
              ),
              const SizedBox(height: 8),
              Text(
                t.ui.appleAutoRenewNotice,
                style: AppTextStyles.getCaptionStyle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.push('/terms-and-conditions'),
                  child: Text(t.ui.termsOfService),
                ),
                TextButton(
                  onPressed: () => context.push('/privacy-policy'),
                  child: Text(t.legal.privacyPolicy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    final t = Translations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: const EdgeInsets.all(4),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            labelColor: Theme.of(context).colorScheme.onPrimaryContainer,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 2 : 4,
            ),
            isScrollable: false,
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? 'Mens.' : t.ui.monthly,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? '6 M.' : t.ui.semiannual,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 6 : 12,
                    vertical: 8,
                  ),
                  child: Text(
                    isSmallScreen ? 'Ann.' : t.ui.annual,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      fontSize: isSmallScreen ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimplifiedLayout() {
    final t = Translations.of(context);
    final plans = _getSimplifiedPlans();

    return Column(
      children: [
        for (int i = 0; i < plans.length; i++) ...[
          _buildPlanCard(plans[i], t),
          if (i < plans.length - 1) const SizedBox(height: 16),
        ],
        const SizedBox(height: 24),
        // Explore other plans button
        FilledButton.tonal(
          onPressed: () {
            setState(() {
              _showAllPlans = true;
            });
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.ui.exploreOtherPlans,
                style: AppTextStyles.getBodyStyle(context),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.expand_more, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(Translations t) {
    final plans = _getCurrentPlans();
    return Column(
      children: [
        for (int i = 0; i < plans.length; i++) ...[
          _buildPlanCard(plans[i], t),
          if (i < plans.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildPlanCard(SubscriptionPlan plan, Translations t) {
    final isMainCard = plan.cardStyle == CardStyle.main && !plan.isCurrentPlan;
    final isAlternativeCard =
        plan.cardStyle == CardStyle.alternative && !plan.isCurrentPlan;
    final isCurrentPlan = plan.isCurrentPlan;
    final colorScheme = Theme.of(context).colorScheme;

    PriceDisplayStyle priceStyle;
    SubscriptionButtonStyle buttonStyle;
    FeaturesDisplayStyle featuresStyle;
    TrialContainerStyle? trialStyle;

    if (isCurrentPlan) {
      priceStyle = PriceDisplayStyle.main;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.main;
      trialStyle = null;
    } else if (isMainCard) {
      priceStyle = PriceDisplayStyle.main;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.main;
      trialStyle = TrialContainerStyle.main;
    } else if (isAlternativeCard) {
      priceStyle = PriceDisplayStyle.alternative;
      buttonStyle = SubscriptionButtonStyle.alternative;
      featuresStyle = FeaturesDisplayStyle.alternative;
      trialStyle = null;
    } else {
      priceStyle = PriceDisplayStyle.normal;
      buttonStyle = SubscriptionButtonStyle.main;
      featuresStyle = FeaturesDisplayStyle.normal;
      trialStyle = TrialContainerStyle.normal;
    }

    return Card(
      elevation: isCurrentPlan
          ? 12
          : (isMainCard ? 8 : (isAlternativeCard ? 2 : 4)),
      color: colorScheme.surface,
      child: Container(
        decoration: (isCurrentPlan || isMainCard)
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isCurrentPlan
                      ? colorScheme.primary
                      : colorScheme.primary,
                  width: isCurrentPlan ? 3 : 2,
                ),
              )
            : null,
        child: Padding(
          padding: EdgeInsets.all(
            isCurrentPlan || isMainCard ? 20 : (isAlternativeCard ? 16 : 20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (plan.badge != PlanBadge.none) ...[
                Center(child: PlanBadgeWidget(badge: plan.badge)),
                const SizedBox(height: 12),
              ] else if (isMainCard && !isCurrentPlan) ...[
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.primary.withValues(alpha: 0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.stars,
                          color: colorScheme.onPrimary,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          t.ui.recommendedPlan,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Text(
                plan.title,
                style: isMainCard
                    ? AppTextStyles.getH4Style(context)
                    : isAlternativeCard
                    ? AppTextStyles.getH5Style(context)
                    : AppTextStyles.getH4Style(context).copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              PriceDisplay(
                price: plan.price,
                period: plan.period,
                originalPrice: plan.originalPrice,
                discount: plan.discount,
                saveAmount: plan.saveAmount,
                annualTotal: plan.annualTotal,
                extraInfo: plan.extraInfo,
                displayStyle: priceStyle,
              ),
              if (plan.originalPrice != null &&
                  plan.discountedPrice != null) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      plan.originalPrice!,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      plan.discountedPrice!,
                      style: AppTextStyles.getBodyStyle(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
              Text(
                plan.billingInfo,
                style: AppTextStyles.getCaptionStyle(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMainCard ? 16 : 24),
              PlanFeatures(
                features: plan.features,
                excludedFeatures: plan.excludedFeatures,
                displayStyle: featuresStyle,
              ),
              SizedBox(height: isMainCard ? 16 : 24),
              if (isCurrentPlan && plan.nextRenewalDate != null) ...[
                Center(
                  child: RenewalDateDisplay(
                    renewalDate: plan.nextRenewalDate!,
                    cancelAtPeriodEnd: plan.cancelAtPeriodEnd,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (!_isLoadingTrialEligibility &&
                  _hasTrialEligibility &&
                  !isCurrentPlan &&
                  trialStyle != null) ...[
                TrialInfoContainer(containerStyle: trialStyle),
                SizedBox(height: isMainCard ? 12 : 16),
              ],
              if (_subscriptionManagedElsewhere)
                Text(
                  managedElsewhereMessage(
                    t,
                    _subscriptionStatus!.subscription!,
                  ),
                  style: AppTextStyles.getCaptionStyle(context),
                  textAlign: TextAlign.center,
                )
              else if (isCurrentPlan)
                FilledButton.icon(
                  onPressed: () => _handleManageSubscription(context),
                  icon: const Icon(Icons.settings),
                  label: Text(t.ui.manageSubscription),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                )
              else
                SubscriptionButton(
                  isLoading: _isLoadingTrialEligibility,
                  hasTrialEligibility:
                      _hasTrialEligibility &&
                      !(_subscriptionStatus?.hasActiveSubscription ?? false),
                  onPressed: () => _handlePlanAction(context, plan),
                  buttonStyle: buttonStyle,
                  customText: _getButtonLabel(plan, t),
                ),
              if (isMainCard || isAlternativeCard) ...[
                const SizedBox(height: 6),
                Text(
                  t.ui.thenPrice(price: plan.price, period: plan.period),
                  style: AppTextStyles.getCaptionStyle(context),
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: isMainCard ? 12 : 16),
              if ((isMainCard || isAlternativeCard) && !_usesAppleStore)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.security, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      t.ui.moneyBackGuarantee,
                      style: AppTextStyles.getCaptionStyle(context)
                          .copyWith(color: colorScheme.primary),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
