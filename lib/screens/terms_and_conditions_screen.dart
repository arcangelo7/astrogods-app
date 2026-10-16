import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../i18n/translations.g.dart';
import '../widgets/starry_night_background.dart';
import '../constants/text_styles.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(Translations t) {
    return [
      t.legal.termsIntroductionSection,
      t.legal.astrologicalServiceNatureSection,
      t.legal.termsOfUseSection,
      t.legal.differentiatedLicensingSection,
      t.legal.salesTermsSection,
      t.legal.deliverySection,
      t.legal.contractDurationSection,
      t.legal.userRightsSection,
      t.legal.liabilitySection,
      t.legal.commonProvisionsSection,
      t.legal.disputeResolutionSection,
      t.legal.privacyPolicySection,
      t.legal.cookiesAndTrackingSection,
      t.legal.definitionsSection,
      t.legal.contactUsSection,
    ];
  }

  GlobalKey _getSectionKey(String section) {
    return _sectionKeys.putIfAbsent(section, () => GlobalKey());
  }

  void _scrollToSection(int index, List<String> sections) {
    setState(() {
      _selectedIndex = index;
      _isScrollingToSection = true;
    });
    final key = _sectionKeys[sections[index]];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        _isScrollingToSection = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrollingToSection) return;

    final t = Translations.of(context);
    final sections = _getSections(t);

    int newIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < sections.length; i++) {
      final key = _sectionKeys[sections[i]];
      if (key?.currentContext != null) {
        final RenderBox? box =
            key!.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 100).abs();

          if (distance < minDistance) {
            minDistance = distance;
            newIndex = i;
          }
        }
      }
    }

    if (newIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final sections = _getSections(t);
    final isWideScreen = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      floatingActionButton: !isWideScreen
          ? _buildTableOfContentsFAB(context)
          : null,
      body: StarryNightBackground(
        showPlanet: false,
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
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/settings');
                    }
                  },
                ),
                title: Text(
                  t.legal.termsAndConditions,
                  style: AppTextStyles.getH4Style(context),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigation Rail for wide screens
                    if (isWideScreen)
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context).colorScheme.outline
                                  .withValues(alpha: 0.2),
                              width: 1.5,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow
                                  .withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(2, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withValues(alpha: 0.2),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).colorScheme.outline
                                        .withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.format_list_bulleted,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      t.legal.termsTableOfContents,
                                      style: AppTextStyles.getH5Style(context)
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: sections.length,
                                itemBuilder: (context, index) {
                                  final isSelected = _selectedIndex == index;
                                  return InkWell(
                                    onTap: () =>
                                        _scrollToSection(index, sections),
                                    borderRadius: BorderRadius.circular(12),
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border: isSelected
                                            ? Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withValues(alpha: 0.3),
                                                width: 1.5,
                                              )
                                            : null,
                                        boxShadow: isSelected
                                            ? [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withValues(alpha: 0.1),
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 12.0,
                                        ),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(
                                                milliseconds: 200,
                                              ),
                                              width: isSelected ? 8 : 6,
                                              height: isSelected ? 8 : 6,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelected
                                                    ? Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                    : Theme.of(context)
                                                          .colorScheme
                                                          .onSurface
                                                          .withValues(
                                                            alpha: 0.4,
                                                          ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: AnimatedDefaultTextStyle(
                                                duration: const Duration(
                                                  milliseconds: 200,
                                                ),
                                                style:
                                                    AppTextStyles.getCaptionStyle(
                                                      context,
                                                    ).copyWith(
                                                      color: isSelected
                                                          ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                          : Theme.of(context)
                                                                .colorScheme
                                                                .onSurface,
                                                      fontWeight: isSelected
                                                          ? FontWeight.w600
                                                          : FontWeight.normal,
                                                      fontSize: isSelected
                                                          ? 13
                                                          : 12,
                                                    ),
                                                child: Text(
                                                  sections[index],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Main Content
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isWideScreen ? 24.0 : 24.0,
                            vertical: isWideScreen ? 48.0 : 24.0,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: isWideScreen ? 700 : double.infinity,
                          ),
                          child: SelectionArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header
                                Center(
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 800,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          t.legal.termsAndConditionsTitle,
                                          style: AppTextStyles.getH2Style(
                                            context,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          t.legal.termsAcceptanceRequired,
                                          style:
                                              AppTextStyles.getBodyStyle(
                                                context,
                                              ).copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(alpha: 0.7),
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          t.legal.lastModifiedTerms,
                                          style:
                                              AppTextStyles.getCaptionStyle(
                                                context,
                                              ).copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(alpha: 0.6),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 48),

                                // Introduction Section
                                _buildSectionWithKey(
                                  sections[0],
                                  _buildIntroductionSection(context),
                                ),

                                // Astrological Service Nature Section
                                _buildSectionWithKey(
                                  sections[1],
                                  _buildAstrologicalServiceNatureSection(
                                    context,
                                  ),
                                ),

                                // Terms of Use Section
                                _buildSectionWithKey(
                                  sections[2],
                                  _buildTermsOfUseSection(context),
                                ),

                                // Differentiated Licensing Section
                                _buildSectionWithKey(
                                  sections[3],
                                  _buildDifferentiatedLicensingSection(context),
                                ),

                                // Sales Terms Section
                                _buildSectionWithKey(
                                  sections[4],
                                  _buildSalesTermsSection(context),
                                ),

                                // Delivery Section
                                _buildSectionWithKey(
                                  sections[5],
                                  _buildDeliverySection(context),
                                ),

                                // Contract Duration Section
                                _buildSectionWithKey(
                                  sections[6],
                                  _buildContractDurationSection(context),
                                ),

                                // User Rights Section
                                _buildSectionWithKey(
                                  sections[7],
                                  _buildUserRightsSection(context),
                                ),

                                // Liability Section
                                _buildSectionWithKey(
                                  sections[8],
                                  _buildLiabilitySection(context),
                                ),

                                // Common Provisions Section
                                _buildSectionWithKey(
                                  sections[9],
                                  _buildCommonProvisionsSection(context),
                                ),

                                // Dispute Resolution Section
                                _buildSectionWithKey(
                                  sections[10],
                                  _buildDisputeResolutionSection(context),
                                ),

                                // Privacy Policy Section
                                _buildSectionWithKey(
                                  sections[11],
                                  _buildPrivacyPolicySection(context),
                                ),

                                // Cookies and Tracking Section
                                _buildSectionWithKey(
                                  sections[12],
                                  _buildCookiesAndTrackingSection(context),
                                ),

                                // Definitions Section
                                _buildSectionWithKey(
                                  sections[13],
                                  _buildDefinitionsSection(context),
                                ),

                                // Contact Us Section
                                _buildSectionWithKey(
                                  sections[14],
                                  _buildContactUsSection(context),
                                ),

                                const SizedBox(height: 48),

                                // Footer
                                _buildFooterSection(context),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).padding.bottom +
                                      24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionWithKey(String title, Widget content) {
    return Container(key: _getSectionKey(title), child: content);
  }

  Widget _buildSection(
    BuildContext context,
    IconData icon,
    String title,
    Widget content,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 56.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline
                  .withValues(alpha: 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow
                    .withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer
                      .withValues(alpha: 0.3),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary
                            .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: Theme.of(context).colorScheme.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.getH3Style(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.all(24.0), child: content),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroductionSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.article_outlined,
      t.legal.termsIntroduction,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.termsGovernText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, t.legal.useOfService),
          _buildBulletPoint(context, t.legal.legalRelationship),
          const SizedBox(height: 16),
          Text(
            t.legal.bindingManner,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.termsAcceptanceRequired,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            t.legal.appleThirdPartyBeneficiary,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.astroGodsServiceOf,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          Text(t.legal.ownerName, style: AppTextStyles.getBodyStyle(context)),
          const SizedBox(height: 8),
          Wrap(
            children: [
              Text(
                "${t.legal.ownerEmail} ",
                style: AppTextStyles.getBodyStyle(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => _launchExternalUrl('mailto:contact@astrogods.it'),
                child: Text(
                  'contact@astrogods.it',
                  style: AppTextStyles.getBodyStyle(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.astroGodsRefersTo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, t.legal.thisSiteDescription),
          _buildBulletPoint(context, t.legal.mobileApplicationsDescription),
        ],
      ),
    );
  }

  Widget _buildAstrologicalServiceNatureSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.auto_awesome,
      t.legal.astrologicalServiceNature,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.astrologicalServiceDescription,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint1),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint2),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint3),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint4),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint5),
          _buildBulletPoint(context, t.legal.astrologicalServicePoint6),
        ],
      ),
    );
  }

  Widget _buildTermsOfUseSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.verified_user_outlined,
      t.legal.termsOfUse,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // General validity
          Text(
            t.legal.termsOfUseGeneralValidity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.additionalConditions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.usingAstroGodsUserDeclares,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.consumerRequirement),
          _buildBulletPoint(context, t.legal.notUnderEmbargo),
          _buildBulletPoint(context, t.legal.notOnProhibitedList),

          const SizedBox(height: 24),

          // Registration Section
          _buildSubSectionTitle(context, t.legal.registration),
          Text(
            t.legal.registrationRequired,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.passwordSecurity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.accountResponsibility,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Registration Requirements
          _buildSubSectionTitle(context, t.legal.accountRequirements),
          Text(
            t.legal.registrationRequirementsText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.botRegistrationProhibited),
          _buildBulletPoint(context, t.legal.oneAccountPerUser),
          _buildBulletPoint(context, t.legal.accountSharingProhibited),

          const SizedBox(height: 24),

          // Account Closure
          _buildSubSectionTitle(context, t.legal.accountClosureTitle),
          Text(
            t.legal.accountClosureProcedure,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.usingAccountClosureTools),
          const SizedBox(height: 16),
          Text(
            t.legal.paidSubscriptionSuspension,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Account Suspension and Cancellation
          _buildSubSectionTitle(context, t.legal.accountSuspension),
          Text(
            t.legal.accountSuspensionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.noCompensationForSuspension,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.paymentObligationRemains,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // External Resources
          _buildSubSectionTitle(context, t.legal.externalResources),
          Text(
            t.legal.externalResourcesDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.thirdPartyResourcesDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Permitted Use
          _buildSubSectionTitle(context, t.legal.permittedUse),
          Text(
            t.legal.permittedUseText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.userExclusiveResponsibility,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.ownerProtectiveRights,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.violationsOfLaw),
          _buildBulletPoint(context, t.legal.injuryToThirdPartyRights),
          _buildBulletPoint(context, t.legal.actsHarmingOwnerInterests),
          _buildBulletPoint(context, t.legal.offensesToOwnerOrThird),

          const SizedBox(height: 24),

          // Referral Program
          _buildSubSectionTitle(context, t.legal.referralProgram),
          Text(
            t.legal.referralBenefits,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.referralCodeUsage,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.referralRewardSystem,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.referralCodeLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.ownerDiscretionaryRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.referralLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesTermsSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.storefront_outlined,
      t.legal.salesTerms,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Paid Products
          _buildSubSectionTitle(context, t.legal.paidProducts),
          Text(
            t.legal.salesTermsIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.salesTermsDetails,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.purchaseRegistrationRequired,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Product Description
          _buildSubSectionTitle(context, t.legal.productDescription),
          Text(
            t.legal.productDescriptionInfo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.productRepresentationDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.productCharacteristicsSpecified,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Purchase Procedure
          _buildSubSectionTitle(context, t.legal.purchaseProcedure),
          Text(
            t.legal.purchaseProcedureSteps,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.stripeCheckoutAccess),
          _buildBulletPoint(context, t.legal.stripePaymentStorage),
          _buildBulletPoint(context, t.legal.stripeBillingAddress),
          _buildBulletPoint(context, t.legal.stripeExpressCheckout),
          const SizedBox(height: 16),
          Text(
            t.legal.orderSubmissionRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Order Submission
          _buildSubSectionTitle(context, t.legal.orderSubmission),
          Text(
            t.legal.orderSubmissionConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.contractConclusion),
          _buildBulletPoint(context, t.legal.userCollaborationObligation),
          _buildBulletPoint(context, t.legal.orderConfirmationEmail),
          const SizedBox(height: 16),
          Text(
            t.legal.purchaseNotifications,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Pricing
          _buildSubSectionTitle(context, t.legal.pricing),
          Text(
            t.legal.pricingTransparency,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.pricingPolicy,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Promotions and Discounts
          _buildSubSectionTitle(context, t.legal.promotionsAndDiscounts),
          Text(
            t.legal.promotionsDisclaimer,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.promotionsDiscretion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.promotionsNoRights,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.promotionsTimeLimit,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Vouchers
          _buildSubSectionTitle(context, t.legal.vouchers),
          Text(
            t.legal.vouchersPromoForm,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.vouchersViolationConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.vouchersAdditionalProvisions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.vouchersRules,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.voucherValidityRule),
          _buildBulletPoint(context, t.legal.voucherFullRedemption),
          _buildBulletPoint(context, t.legal.voucherSingleUse),
          _buildBulletPoint(context, t.legal.vouchersNotCumulative),
          _buildBulletPoint(context, t.legal.voucherExpiration),
          _buildBulletPoint(context, t.legal.voucherNoCredit),
          _buildBulletPoint(context, t.legal.voucherNonCommercialUse),

          const SizedBox(height: 24),

          // Payment Methods
          _buildSubSectionTitle(context, t.legal.paymentMethods),
          Text(
            t.legal.paymentMethodsInfo,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.paymentMethodsConditions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.paymentThirdPartyHandling,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.paymentFailureConsequences,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Stripe Recurring Payments
          Text(
            t.legal.stripeRecurringPayments,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.stripeCustomerPortal,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // App Store Purchases
          _buildSubSectionTitle(context, t.legal.purchaseViaAppStore),
          Text(
            t.legal.appStorePurchases,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.appStoreTermsPrecedence,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.appStoreTermsAcceptance,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Ownership Reservation
          _buildSubSectionTitle(context, t.legal.ownershipReservationTitle),
          Text(
            t.legal.ownershipReservation,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Usage Rights Reservation
          _buildSubSectionTitle(context, t.legal.usageRightsReservationTitle),
          Text(
            t.legal.usageRightsReservation,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contractual Withdrawal Right
          _buildSubSectionTitle(
            context,
            t.legal.contractualWithdrawalRightTitle,
          ),
          Text(
            t.legal.contractualWithdrawalRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverySection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.cloud_download_outlined,
      t.legal.delivery,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Digital Content Delivery
          _buildSubSectionTitle(context, t.legal.deliveryOfDigitalContent),
          Text(
            t.legal.digitalContentDeliveryDetails,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.deviceRequirements,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.downloadLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContractDurationSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.access_time_outlined,
      t.legal.contractDuration,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trial Period
          Text(
            t.legal.trialPeriod,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.trialPeriodAvailability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.trialAutoConversion,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Subscriptions
          Text(
            t.legal.subscriptions,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.subscriptionContinuousProduct,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Lifetime Subscriptions
          Text(
            t.legal.lifetimeSubscriptions,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.lifetimeSubscriptionDuration,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.lifetimeRefundPolicy,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Fixed-term Subscriptions
          Text(
            t.legal.fixedTermSubscriptions,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.fixedTermSubscriptionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.fixedTermSubscriptionEnd,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Apple Account Subscriptions
          Text(
            t.legal.appleAccountSubscriptionsTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.appleAccountSubscriptions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.appleAccountPayment),
          _buildBulletPoint(context, t.legal.appleAccountAutoRenewal),
          _buildBulletPoint(context, t.legal.appleAccountRenewalCharges),
          _buildBulletPoint(context, t.legal.appleAccountManagement),
          const SizedBox(height: 16),
          Text(
            t.legal.appleTermsPrecedence,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 20),

          // Automatic Renewal
          Text(
            t.legal.automaticRenewal,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.automaticRenewalPolicy,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.renewalDurationMatch,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 16),

          // Termination
          Text(
            t.legal.cancellation,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Text(
            t.legal.subscriptionTermination,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.cancellationEffectiveTiming,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          // Consumer Exception
          _buildSubSectionTitle(context, t.legal.consumerExceptionTitle),
          Text(
            t.legal.consumerExceptionText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.consumerIndefiniteExtension,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.consumerRenewalCharging,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.consumerMonthlyTermination,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 24),

          // Resolution (subsection within Consumer Exception)
          _buildSubSectionTitle(context, t.legal.resolution),
          Text(
            t.legal.subscriptionTermination,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.consumerCancellationTiming,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRightsSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.balance_outlined,
      t.legal.userRights,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Right of Withdrawal - Main section
          _buildSubSectionTitle(context, t.legal.rightOfWithdrawal),
          Text(
            t.legal.withdrawalRightSummary,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 24),

          // Who has withdrawal rights
          _buildSubSectionTitle(context, t.legal.whoHasWithdrawalRights),
          Text(
            t.legal.europeanConsumersWithdrawal,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.nonEuropeanUsersNoRights,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Exercise of withdrawal right
          _buildSubSectionTitle(context, t.legal.exerciseOfWithdrawalRight),
          Text(
            t.legal.withdrawalExercise,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.withdrawalFormInstructions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.withdrawalDeadlineQuestion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          _buildBulletPoint(context, t.legal.digitalContentWithdrawalDeadline),

          const SizedBox(height: 24),

          // Effects of withdrawal
          _buildSubSectionTitle(context, t.legal.effectsOfWithdrawal),
          Text(
            t.legal.withdrawalEffects,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.deliveryCostException,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.refundTimeline,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLiabilitySection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.security_outlined,
      t.legal.liabilityAndIndemnification,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indemnification
          _buildSubSectionTitle(context, t.legal.indemnification),
          Text(
            t.legal.indemnificationText,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // User Activity Liability Limitation
          _buildSubSectionTitle(
            context,
            t.legal.userActivityLiabilityLimitation,
          ),
          Text(
            t.legal.generalLiabilityExclusion,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.liabilityExceptions,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.limitedLiabilityScope,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.noResponsibilityIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.legal.forceMAjeureExclusion),
          const SizedBox(height: 8),
          _buildBulletPoint(context, t.legal.indirectLossExclusion),
          const SizedBox(height: 8),
          _buildBulletPoint(context, t.legal.nonDirectLossExclusion),
        ],
      ),
    );
  }

  Widget _buildCommonProvisionsSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.fact_check_outlined,
      t.legal.commonProvisions,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // No Implicit Waiver
          _buildSubSectionTitle(context, t.legal.noWaiverImplied),
          Text(
            t.legal.noImplicitWaiver,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Interruption
          _buildSubSectionTitle(context, t.legal.serviceInterruption),
          Text(
            t.legal.serviceMaintenanceRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.serviceTerminationRights,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.forceMAjeureUnavailability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.advanceNotice,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Resale
          _buildSubSectionTitle(context, t.legal.serviceResale),
          Text(
            t.legal.unauthorizedResale,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Terms Modification
          _buildSubSectionTitle(context, t.legal.termsModification),
          Text(
            t.legal.termsModificationRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.modificationsEffectiveDate,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.termsModificationAcceptance,
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.previousVersionValidity,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.advanceNotificationRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contract Assignment
          _buildSubSectionTitle(context, t.legal.contractAssignment),
          Text(
            t.legal.contractTransferRight,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.assignmentTermsApplication,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.userAssignmentRestriction,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Contacts
          _buildSubSectionTitle(context, t.legal.contacts),
          Text(
            t.legal.communicationRequirement,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Severability Clause
          _buildSubSectionTitle(context, t.legal.severabilityClause),
          Text(
            t.legal.generalSeverability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.europeanUsersTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.europeanSeverability,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.severabilityLimitations,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Applicable Law
          _buildSubSectionTitle(context, t.legal.applicableLaw),
          Text(
            t.legal.governingLaw,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.nationalLawPrevalence,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.nationalLawPrevails,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Competent Jurisdiction
          _buildSubSectionTitle(context, t.legal.competentJurisdiction),
          Text(
            t.legal.exclusiveJurisdiction,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.europeanConsumerExceptionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.europeanConsumerException,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDisputeResolutionSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.handshake_outlined,
      t.legal.disputeResolution,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Amicable Dispute Composition
          _buildSubSectionTitle(context, t.legal.amicableDisputeComposition),
          Text(
            t.legal.amicableDisputeResolution,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.judicialRightsPreservation,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.complaintProcedure,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Text(
            t.legal.responseTimeline,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyPolicySection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.privacy_tip_outlined,
      t.legal.privacyPolicySection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.privacyPolicyReferenceContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/privacy-policy');
              },
              icon: const Icon(Icons.privacy_tip),
              label: Text(t.legal.viewPrivacyPolicy),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCookiesAndTrackingSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.track_changes_outlined,
      t.legal.cookiesAndTrackingTitle,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.cookiesAndTrackingReferenceContent,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/cookie-policy');
              },
              icon: const Icon(Icons.cookie),
              label: Text(t.legal.viewCookiePolicy),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionsSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.menu_book_outlined,
      t.legal.definitions,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AstroGods Definition
          Text(
            t.legal.astroGodsDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.astroGodsDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Agreement Definition
          Text(
            t.legal.agreementDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.agreementDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Voucher Definition
          Text(
            t.legal.voucherDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.voucherDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // European Definition
          Text(
            t.legal.europeanDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.europeanDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Withdrawal Form
          Text(
            t.legal.withdrawalFormTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest
                  .withValues(alpha: 0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline
                    .withValues(alpha: 0.3),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow
                      .withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        t.legal.withdrawalFormHeader,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  t.legal.withdrawalFormAddress,
                  style: AppTextStyles.getBodyStyle(context).copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary
                          .withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.legal.withdrawalFormNotification,
                        style: AppTextStyles.getBodyStyle(context).copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.legal.withdrawalFormDescription,
                        style: AppTextStyles.getBodyStyle(context)
                            .copyWith(fontStyle: FontStyle.italic, height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBulletPoint(
                        context,
                        t.legal.withdrawalFormOrderDate,
                      ),
                      _buildBulletPoint(
                        context,
                        t.legal.withdrawalFormReceiveDate,
                      ),
                      _buildBulletPoint(
                        context,
                        t.legal.withdrawalFormConsumerName,
                      ),
                      _buildBulletPoint(
                        context,
                        t.legal.withdrawalFormConsumerAddress,
                      ),
                      _buildBulletPoint(context, t.legal.withdrawalFormDate),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline
                          .withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t.legal.withdrawalFormSignature,
                          style: AppTextStyles.getBodyStyle(context).copyWith(
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Owner Definition
          Text(
            t.legal.ownerDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.ownerDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Product Definition
          Text(
            t.legal.productDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.productDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Service Definition
          Text(
            t.legal.serviceDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.serviceDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Terms Definition
          Text(
            t.legal.termsDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.termsDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // User Definition
          Text(
            t.ui.userDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(t.ui.userDefinition, style: AppTextStyles.getBodyStyle(context)),

          const SizedBox(height: 24),

          // Consumer Definition
          Text(
            t.legal.consumerDefinitionTitle,
            style: AppTextStyles.getH4Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            t.legal.consumerDefinition,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContactUsSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.contact_support_outlined,
      t.legal.contactUsSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.amicableDisputeResolution,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchExternalUrl('mailto:contact@astrogods.it'),
            icon: const Icon(Icons.email_outlined),
            label: Text(t.legal.contactUs),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifferentiatedLicensingSection(BuildContext context) {
    final t = Translations.of(context);
    return _buildSection(
      context,
      Icons.copyright_outlined,
      t.legal.differentiatedLicensing,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.legal.differentiatedLicensingText,
            style: AppTextStyles.getBodyStyle(context),
          ),

          const SizedBox(height: 24),

          // Proprietary Standard Content
          _buildSubSectionTitle(context, t.legal.proprietaryContentStandard),
          Text.rich(
            TextSpan(
              style: AppTextStyles.getBodyStyle(context),
              children: [
                TextSpan(text: t.legal.proprietaryContentStandardTextBefore),
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: InkWell(
                    onTap: () => _launchExternalUrl(
                      'https://github.com/arcangelo7/astrogods-app',
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    child: Text(
                      'github.com/arcangelo7/astrogods-app',
                      style: AppTextStyles.getBodyStyle(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                TextSpan(text: t.legal.proprietaryContentStandardTextAfter),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Codex Creative Commons
          _buildSubSectionTitle(context, t.codex.codexCreativeCommons),
          Text(
            t.codex.codexCreativeCommonsText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint(context, t.codex.codexRights1),
          _buildBulletPoint(context, t.codex.codexRights2),
          _buildBulletPoint(context, t.codex.codexRights3),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer
                      .withValues(alpha: 0.4),
                  Theme.of(context).colorScheme.primaryContainer
                      .withValues(alpha: 0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary
                    .withValues(alpha: 0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary
                      .withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    t.codex.codexAttributionRequired,
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Third-party license hierarchy
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiaryContainer
                      .withValues(alpha: 0.3),
                  Theme.of(context).colorScheme.tertiaryContainer
                      .withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary
                    .withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: 22,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    t.codex.codexThirdPartyLicenseHierarchy,
                    style: AppTextStyles.getBodyStyle(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // AI Generated Interpretations
          _buildSubSectionTitle(context, t.legal.astrologicalInterpretations),
          Text(
            t.legal.astrologicalInterpretationsText,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    final t = Translations.of(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outline
                  .withValues(alpha: 0.2),
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              t.ui.appTitle,
              style: AppTextStyles.getH4Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              t.legal.ownerName,
              style: AppTextStyles.getCaptionStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "${t.legal.ownerEmail} ",
                  style: AppTextStyles.getCaptionStyle(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () =>
                      _launchExternalUrl('mailto:contact@astrogods.it'),
                  child: Text(
                    'contact@astrogods.it',
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.getBodyStyle(context).copyWith(
                height: 1.5,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer
            .withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 4,
          ),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.getH4Style(context).copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildTableOfContentsFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showTableOfContentsBottomSheet(context),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.menu_book),
    );
  }

  void _showTableOfContentsBottomSheet(BuildContext context) {
    final t = Translations.of(context);
    final sections = _getSections(t);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline
                      .withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      t.legal.termsTableOfContents,
                      style: AppTextStyles.getH5Style(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return InkWell(
                      onTap: () {
                        _scrollToSection(index, sections);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onSurface
                                            .withValues(alpha: 0.4),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  sections[index],
                                  style: AppTextStyles.getBodyStyle(context)
                                      .copyWith(
                                        color: isSelected
                                            ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                            : Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);
    final errorMessage = Translations.of(context).ui.errorOpeningUrl;
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('$errorMessage: $e');
    }
  }
}
