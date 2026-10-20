import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/flash_highlight.dart';
import '../widgets/choice_chip_group.dart';
import '../widgets/local_flag.dart';
import '../i18n/translations.g.dart';
import '../providers/language_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';
import '../services/auth_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../providers/theme_provider.dart';
import '../config/environment.dart';
import '../services/subscription_service.dart';
import '../models/subscription.dart';
import '../widgets/subscription_card.dart';
import '../services/newsletter_service.dart';
import '../widgets/newsletter_subscription_dialog.dart';
import '../widgets/newsletter_edit_dialog.dart';
import '../utils/error_utils.dart';

enum SettingsSection { subscriptions, deleteAccount }

class SettingsScreen extends StatefulWidget {
  final SettingsSection? section;

  const SettingsScreen({super.key, this.section});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SubscriptionStatusResponse? _subscriptionStatus;
  bool _isLoadingSubscriptions = false;
  String? _subscriptionError;
  bool _hasInitialized = false;

  NewsletterSubscriptions? _newsletterSubscriptions;
  bool _isLoadingNewsletters = false;
  String? _newsletterError;

  final _subscriptionsKey = GlobalKey();
  final _deleteAccountKey = GlobalKey();
  bool _revealScheduled = false;
  bool _sectionRevealed = false;

  @override
  void initState() {
    super.initState();
    // Defer loading subscriptions until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndLoadSubscriptions();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Re-check auth status when dependencies change
    if (!_hasInitialized) {
      _checkAuthAndLoadSubscriptions();
    }
  }

  void _checkAuthAndLoadSubscriptions() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isAuthenticated && !authProvider.isLoading) {
      if (!_hasInitialized) {
        _hasInitialized = true;
        _loadSubscriptions();
        _loadNewsletters();
      }
    }
  }

  // The sections change height while subscriptions and newsletters load, so
  // the requested section is scrolled into view only once both have loaded.
  void _revealSectionWhenLoaded() {
    if (widget.section == null ||
        _revealScheduled ||
        !_hasInitialized ||
        _isLoadingSubscriptions ||
        _isLoadingNewsletters) {
      return;
    }
    _revealScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final key = switch (widget.section!) {
        SettingsSection.subscriptions => _subscriptionsKey,
        SettingsSection.deleteAccount => _deleteAccountKey,
      };
      await Scrollable.ensureVisible(
        key.currentContext!,
        alignment: 0.5,
        duration: const Duration(milliseconds: 400),
      );
      if (mounted) setState(() => _sectionRevealed = true);
    });
  }

  Future<void> _loadSubscriptions() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) return;

    setState(() {
      _isLoadingSubscriptions = true;
      _subscriptionError = null;
    });

    try {
      final subscriptionService = SubscriptionService(context: context);
      final subscriptionStatus = await subscriptionService
          .getSubscriptionStatus();

      if (mounted) {
        setState(() {
          _subscriptionStatus = subscriptionStatus;
          _isLoadingSubscriptions = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _subscriptionError = userErrorMessage(context, e);
          _isLoadingSubscriptions = false;
        });
      }
    }
  }

  Future<void> _loadNewsletters() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) return;

    setState(() {
      _isLoadingNewsletters = true;
      _newsletterError = null;
    });

    try {
      final newsletterService = NewsletterService();
      final newsletters = await newsletterService.getSubscriptions();

      if (mounted) {
        setState(() {
          _newsletterSubscriptions = newsletters;
          _isLoadingNewsletters = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _newsletterError = userErrorMessage(context, e);
          _isLoadingNewsletters = false;
        });
      }
    }
  }

  Future<void> _showDeleteAccountDialog(BuildContext context) async {
    final t = Translations.of(context);
    if (_subscriptionStatus?.hasActiveSubscription == true) {
      if (_subscriptionStatus!.subscription!.isApple) {
        await _showStandardDeleteAccountDialog(
          context,
          warning: t.ui.appleSubscriptionDeleteWarning,
        );
        return;
      }
      await _showActiveSubscriptionDeleteDialog(context);
      return;
    }
    await _showStandardDeleteAccountDialog(
      context,
      warning: t.ui.deleteAccountWarning,
    );
  }

  Future<bool?> _showDeleteConfirmationDialog({
    required BuildContext context,
    required String title,
    required String warning,
    required String confirmButtonText,
    String? additionalText,
  }) async {
    final t = Translations.of(context);
    final TextEditingController confirmController = TextEditingController();

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(title, style: AppTextStyles.getH5Style(context)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(warning, style: AppTextStyles.getBodyStyle(context)),
                    const SizedBox(height: 16),
                    Text(
                      additionalText ?? t.ui.typeDeleteToConfirm,
                      style: AppTextStyles.getBodyStyle(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: confirmController,
                      decoration: InputDecoration(
                        labelText: t.ui.typeDeleteToConfirm,
                        labelStyle: AppTextStyles.getCaptionStyle(context),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      style: AppTextStyles.getBodyStyle(context),
                      onChanged: (value) => setState(() {}),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: Text(
                    t.ui.cancel,
                    style: AppTextStyles.getButtonStyle(context),
                  ),
                ),
                TextButton(
                  onPressed:
                      confirmController.text.trim().toUpperCase() !=
                          t.ui.deleteConfirmationWord.toUpperCase()
                      ? null
                      : () => Navigator.of(dialogContext).pop(true),
                  child: Text(
                    confirmButtonText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showActiveSubscriptionDeleteDialog(BuildContext context) async {
    final t = Translations.of(context);
    final result = await _showDeleteConfirmationDialog(
      context: context,
      title: t.ui.deleteAccountTitle,
      warning: t.ui.activeSubscriptionDeleteWarning,
      confirmButtonText: t.ui.cancelSubscriptionAndDelete,
    );
    if (result == true && context.mounted) {
      await _cancelSubscriptionAndDeleteAccount(context);
    }
  }

  Future<void> _cancelSubscriptionAndDeleteAccount(BuildContext context) async {
    final t = Translations.of(context);
    final subscriptionService = SubscriptionService(context: context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 16),
            Expanded(child: Text(t.ui.cancellingSubscription)),
          ],
        ),
      ),
    );

    try {
      await subscriptionService.cancelSubscription();
      if (!context.mounted) return;
      Navigator.of(context).pop();
      SnackbarUtils.showSuccess(
        context,
        t.ui.subscriptionCancelledSuccessfully,
      );
      await _deleteAccount(context);
    } catch (e) {
      if (!context.mounted) return;
      Navigator.of(context).pop();
      if (e is ApiException && e.message.isNotEmpty) {
        SnackbarUtils.showError(context, e.message);
      } else {
        SnackbarUtils.showError(context, t.ui.unknownErrorOccurred);
      }
    }
  }

  Future<void> _showStandardDeleteAccountDialog(
    BuildContext context, {
    required String warning,
  }) async {
    final t = Translations.of(context);
    final result = await _showDeleteConfirmationDialog(
      context: context,
      title: t.ui.deleteAccountTitle,
      warning: warning,
      confirmButtonText: t.ui.delete,
      additionalText: t.ui.deleteAccountConfirmation,
    );
    if (result == true && context.mounted) {
      await _deleteAccount(context);
    }
  }

  Future<void> _deleteAccount(BuildContext context) async {
    final t = Translations.of(context);
    final authService = AuthService();

    final response = await authService.deleteAccount();

    if (!context.mounted) return;

    if (response.success) {
      SnackbarUtils.showSuccess(context, t.ui.accountDeleted);

      // Clear auth provider without calling logout API (already handled by deleteAccount)
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.clearSessionAfterAccountDeletion();

      if (context.mounted) {
        context.go('/');
      }
    } else {
      SnackbarUtils.showError(context, response.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _revealSectionWhenLoaded();

    return Scaffold(
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                title: Text(t.ui.settingsTitle),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Preferences Section
                      Text(
                        t.ui.preferences,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Consumer<LanguageProvider>(
                        builder: (context, languageProvider, _) =>
                            _buildPreferenceCard(
                              icon: const Icon(Icons.language),
                              title: t.ui.language,
                              selector: ChoiceChipGroup<String>(
                                options: [
                                  ChoiceChipOption(
                                    value: 'en',
                                    label: t.ui.english,
                                    avatar: const LocalFlag(countryCode: 'us'),
                                  ),
                                  ChoiceChipOption(
                                    value: 'it',
                                    label: t.ui.italian,
                                    avatar: const LocalFlag(countryCode: 'it'),
                                  ),
                                ],
                                selected:
                                    languageProvider.currentLocale.languageCode,
                                onSelected: (code) => languageProvider
                                    .changeLanguage(Locale(code)),
                              ),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Consumer<ThemeProvider>(
                        builder: (context, themeProvider, _) =>
                            _buildPreferenceCard(
                              icon: Icon(
                                themeProvider.isDarkMode
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                              ),
                              title: t.ui.theme,
                              selector: ChoiceChipGroup<ThemeMode>(
                                options: [
                                  ChoiceChipOption(
                                    value: ThemeMode.light,
                                    label: t.ui.lightMode,
                                    avatar: const Icon(Icons.light_mode),
                                  ),
                                  ChoiceChipOption(
                                    value: ThemeMode.dark,
                                    label: t.ui.darkMode,
                                    avatar: const Icon(Icons.dark_mode),
                                  ),
                                  ChoiceChipOption(
                                    value: ThemeMode.system,
                                    label: t.ui.systemMode,
                                    avatar: const Icon(Icons.settings),
                                  ),
                                ],
                                selected: themeProvider.themeMode,
                                onSelected: themeProvider.setThemeMode,
                              ),
                            ),
                      ),

                      // Newsletter Section
                      if (authProvider.isAuthenticated) ...[
                        const SizedBox(height: 24),
                        Text(
                          t.ui.emailNotifications,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                                    .withValues(alpha: 0.95),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        _buildNewsletterSection(t),
                      ],

                      // Subscriptions Section
                      if (authProvider.isAuthenticated) ...[
                        const SizedBox(height: 24),
                        Text(
                          t.legal.subscriptionsTitle,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                                    .withValues(alpha: 0.95),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        FlashHighlight(
                          key: _subscriptionsKey,
                          active:
                              _sectionRevealed &&
                              widget.section == SettingsSection.subscriptions,
                          child: _buildSubscriptionsSection(t),
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Account Section
                      if (authProvider.isAuthenticated) ...[
                        const SizedBox(height: 24),
                        Text(
                          t.ui.account,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                                    .withValues(alpha: 0.95),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 8),
                        _buildCredentialsCard(t),
                        const SizedBox(height: 8),
                        Card(
                          color: Theme.of(context).colorScheme.surface,
                          child: ListTile(
                            leading: const Icon(Icons.logout),
                            title: Text(t.ui.logout),
                            onTap: () async {
                              await authProvider.logout();
                              if (context.mounted) {
                                context.go('/');
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        FlashHighlight(
                          key: _deleteAccountKey,
                          active:
                              _sectionRevealed &&
                              widget.section == SettingsSection.deleteAccount,
                          child: Card(
                            color: Theme.of(context).colorScheme.error
                                .withValues(alpha: 0.1),
                            child: ListTile(
                              leading: Icon(
                                Icons.delete_forever,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              title: Text(
                                t.ui.deleteAccount,
                                style: AppTextStyles.getBodyStyle(context)
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .error,
                                    ),
                              ),
                              onTap: () => _showDeleteAccountDialog(context),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 24),
                      // About Section
                      Text(
                        t.ui.about,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.95),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.info_outline),
                          title: Text(t.ui.appVersion),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                Environment.appVersion,
                                style: AppTextStyles.getCaptionStyle(context),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                          onTap: () {
                            context.push('/release-notes');
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.description_outlined),
                          title: Text(t.ui.termsOfService),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            context.push('/terms-and-conditions');
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined),
                          title: Text(t.legal.privacyPolicy),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            context.push('/privacy-policy');
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          leading: const Icon(Icons.cookie_outlined),
                          title: Text(t.legal.cookiePolicy),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            context.push('/cookie-policy');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCredentialsCard(Translations t) {
    final user = context.watch<AuthProvider>().currentUser!;
    final chevron = const Icon(Icons.chevron_right);

    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.alternate_email),
            title: Text(t.ui.email),
            subtitle: Text(user.email ?? t.ui.notProvided),
            trailing: chevron,
            onTap: () => context.push('/change-email'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: Text(t.ui.password),
            subtitle: Text(user.hasPassword ? '••••••••' : t.ui.setPassword),
            trailing: chevron,
            onTap: user.hasPassword
                ? () => context.push('/change-password')
                : () => _showSetPasswordDialog(user.email),
          ),
        ],
      ),
    );
  }

  void _showSetPasswordDialog(String? email) {
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.ui.setPassword, style: AppTextStyles.getH5Style(context)),
        content: email == null
            ? Text(
                t.ui.setPasswordNeedsEmail,
                style: AppTextStyles.getBodyStyle(context),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.ui.setPasswordDescription(email: email),
                    style: AppTextStyles.getBodyStyle(context),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.ui.checkSpamFolder,
                    style: AppTextStyles.getCaptionStyle(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.ui.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (email == null) {
                context.push('/change-email');
              } else {
                _requestPasswordSetup(email);
              }
            },
            child: Text(email == null ? t.ui.addEmail : t.ui.sendLink),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPasswordSetup(String email) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.requestPasswordSetup();

    if (!mounted) return;

    if (success) {
      SnackbarUtils.showSuccess(
        context,
        Translations.of(context).ui.passwordSetupLinkSent(email: email),
      );
    } else {
      SnackbarUtils.showError(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
  }

  Widget _buildPreferenceCard({
    required Widget icon,
    required String title,
    required Widget selector,
  }) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [icon, const SizedBox(width: 16), Text(title)]),
            const SizedBox(height: 12),
            selector,
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionsSection(Translations t) {
    if (_isLoadingSubscriptions) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  t.ui.loadingSubscriptions,
                  style: AppTextStyles.getBodyStyle(context),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_subscriptionError != null) {
      return Card(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.error, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t.ui.failedToLoadSubscriptions,
                  style: AppTextStyles.getBodyStyle(context)
                      .copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(
                onPressed: _loadSubscriptions,
                child: Text(t.ui.retry),
              ),
            ],
          ),
        ),
      );
    }

    if (_subscriptionStatus == null || !_subscriptionStatus!.hasSubscription) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.subscriptions_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.onSurface
                    .withValues(alpha: 0.6),
              ),
              const SizedBox(height: 12),
              Text(
                t.ui.noActiveSubscription,
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                      .withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SubscriptionCard(
      subscription: _subscriptionStatus!.subscription!,
      onPortalClosed: _loadSubscriptions,
      isExpired: _subscriptionStatus!.isExpired,
    );
  }

  Widget _buildNewsletterSection(Translations t) {
    if (_isLoadingNewsletters) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }

    if (_newsletterError != null) {
      return Card(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.error, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t.ui.errorTitle,
                  style: AppTextStyles.getBodyStyle(context)
                      .copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(onPressed: _loadNewsletters, child: Text(t.ui.retry)),
            ],
          ),
        ),
      );
    }

    final hasAnySubscriptions =
        _newsletterSubscriptions != null &&
        (_newsletterSubscriptions!.dailySubscriptions.isNotEmpty ||
            _newsletterSubscriptions!.monthlySubscriptions.isNotEmpty);

    if (!hasAnySubscriptions) {
      return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.email_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.onSurface
                    .withValues(alpha: 0.6),
              ),
              const SizedBox(height: 12),
              Text(
                t.ui.noNewsletterSubscriptions,
                style: AppTextStyles.getBodyStyle(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                      .withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _showNewsletterSubscriptionDialog(context),
                icon: const Icon(Icons.add),
                label: Text(t.ui.addNewsletter),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                t.ui.checkSpamFolder,
                style: AppTextStyles.getCaptionStyle(context)
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        if (_newsletterSubscriptions!.dailySubscriptions.isNotEmpty) ...[
          _buildSubscriptionCard(
            icon: Icons.today,
            title: t.ui.dailySkyOf,
            subscriptions: _newsletterSubscriptions!.dailySubscriptions,
            type: 'daily',
            onDelete: _unsubscribeDaily,
            t: t,
          ),
          const SizedBox(height: 8),
        ],
        if (_newsletterSubscriptions!.monthlySubscriptions.isNotEmpty)
          _buildSubscriptionCard(
            icon: Icons.calendar_month,
            title: t.ui.monthlySkyOf,
            subscriptions: _newsletterSubscriptions!.monthlySubscriptions,
            type: 'monthly',
            onDelete: _unsubscribeMonthly,
            t: t,
          ),

        // Add newsletter button
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton.icon(
            onPressed: () => _showNewsletterSubscriptionDialog(context),
            icon: const Icon(Icons.add),
            label: Text(t.ui.addNewsletter),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Spam folder warning
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer
                .withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary
                  .withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.secondary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t.ui.checkSpamFolder,
                  style: AppTextStyles.getCaptionStyle(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface
                        .withValues(alpha: 0.9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriptionCard({
    required IconData icon,
    required String title,
    required List<NewsletterSubscription> subscriptions,
    required String type,
    required Future<void> Function(int) onDelete,
    required Translations t,
  }) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTextStyles.getBodyStyle(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ...subscriptions.map(
              (subscription) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subscription.birthChartName,
                            style: AppTextStyles.getBodyStyle(context),
                          ),
                          Text(
                            subscription.place,
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => _editSubscription(subscription, type),
                      icon: const Icon(Icons.edit_outlined),
                      tooltip: t.ui.edit,
                    ),
                    IconButton(
                      onPressed: () => onDelete(subscription.id),
                      icon: const Icon(Icons.delete_outline),
                      color: Theme.of(context).colorScheme.error,
                      tooltip: t.ui.delete,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _unsubscribeDaily(int newsletterId) async {
    final t = Translations.of(context);
    try {
      final newsletterService = NewsletterService();
      await newsletterService.unsubscribeDailyNewsletter(newsletterId);

      if (mounted) {
        SnackbarUtils.showSuccess(context, t.ui.unsubscribeSuccess);
        _loadNewsletters();
      }
    } catch (e) {
      if (mounted) {
        if (e is ApiException && e.message.isNotEmpty) {
          SnackbarUtils.showError(context, e.message);
        } else {
          SnackbarUtils.showError(context, t.ui.unknownErrorOccurred);
        }
      }
    }
  }

  Future<void> _unsubscribeMonthly(int newsletterId) async {
    final t = Translations.of(context);
    try {
      final newsletterService = NewsletterService();
      await newsletterService.unsubscribeMonthlyNewsletter(newsletterId);

      if (mounted) {
        SnackbarUtils.showSuccess(context, t.ui.unsubscribeSuccess);
        _loadNewsletters();
      }
    } catch (e) {
      if (mounted) {
        if (e is ApiException && e.message.isNotEmpty) {
          SnackbarUtils.showError(context, e.message);
        } else {
          SnackbarUtils.showError(context, t.ui.unknownErrorOccurred);
        }
      }
    }
  }

  void _showNewsletterSubscriptionDialog(BuildContext context) {
    if (context.read<AuthProvider>().currentUser!.email == null) {
      _showEmailRequiredDialog(context);
      return;
    }
    showDialog(
      context: context,
      builder: (context) => const NewsletterSubscriptionDialog(),
    ).then((_) {
      // Reload newsletters after dialog closes
      _loadNewsletters();
    });
  }

  void _showEmailRequiredDialog(BuildContext context) {
    final t = Translations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.ui.addEmail, style: AppTextStyles.getH5Style(context)),
        content: Text(
          t.ui.newsletterNeedsEmail,
          style: AppTextStyles.getBodyStyle(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.ui.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.push('/change-email');
            },
            child: Text(t.ui.addEmail),
          ),
        ],
      ),
    );
  }

  void _editSubscription(NewsletterSubscription subscription, String type) {
    showDialog(
      context: context,
      builder: (context) =>
          NewsletterEditDialog(subscription: subscription, type: type),
    ).then((_) {
      // Reload newsletters after dialog closes
      _loadNewsletters();
    });
  }
}
