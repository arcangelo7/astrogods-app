import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../i18n/translations.g.dart';
import '../utils/email_utils.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/formatted_markdown_content.dart';
import '../constants/text_styles.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};
  int _selectedIndex = 0;
  bool _isScrollingToSection = false;

  List<String> _getSections(Translations t) {
    return [
      t.legal.summarySection,
      t.legal.dataControllerSection,
      t.legal.dataTypesSection,
      t.legal.processingMethodsSection,
      t.legal.purposesSection,
      t.legal.processingDetailsSection,
      t.legal.cookiePolicySection,
      t.legal.euInfoSection,
      t.about.additionalInfoSection,
      t.legal.definitionsSection,
      t.legal.inCaseOfProblems,
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
        // Reset the flag after scrolling is complete
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
    if (_isScrollingToSection) {
      return;
    }

    final t = Translations.of(context);
    final sections = _getSections(t);

    // Find which section is currently visible
    int newIndex = 0;
    double minDistance = double.infinity;

    for (int i = 0; i < sections.length; i++) {
      final key = _sectionKeys[sections[i]];
      if (key?.currentContext != null) {
        final RenderBox? box =
            key!.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 100).abs(); // 100px offset for header

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
                  t.legal.privacyPolicy,
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
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context).colorScheme.outline
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                t.legal.summary,
                                style: AppTextStyles.getH5Style(context)
                                    .copyWith(fontWeight: FontWeight.bold),
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
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 6,
                                              height: 6,
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
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                sections[index],
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
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
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
                                          t.legal.privacyPolicyTitle,
                                          style: AppTextStyles.getH2Style(
                                            context,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          t.legal.privacyPolicyWelcomeText,
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
                                          t.legal.lastModified,
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

                                // Riepilogo Section
                                _buildSectionWithKey(
                                  sections[0], // summarySection
                                  _buildRiepilogoSection(context),
                                ),

                                // Titolare del Trattamento
                                _buildSectionWithKey(
                                  sections[1], // dataControllerSection
                                  _buildSection(
                                    context,
                                    Icons.person,
                                    t.legal.dataControllerSection,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          t.legal.dataControllerName,
                                          style: AppTextStyles.getBodyStyle(
                                            context,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          children: [
                                            Text(
                                              t.legal.dataControllerEmailLabel,
                                              style:
                                                  AppTextStyles.getBodyStyle(
                                                    context,
                                                  ).copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                openEmail(
                                                  context,
                                                  t.legal.dataControllerEmail,
                                                );
                                              },
                                              child: Text(
                                                t.legal.dataControllerEmail,
                                                style:
                                                    AppTextStyles.getBodyStyle(
                                                      context,
                                                    ).copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Tipologie di Dati raccolti
                                _buildSectionWithKey(
                                  sections[2], // dataTypesSection
                                  _buildDataTypesSection(context),
                                ),

                                // Modalità e luogo del trattamento
                                _buildSectionWithKey(
                                  sections[3], // processingMethodsSection
                                  _buildProcessingMethodsSection(context),
                                ),

                                // Finalità del Trattamento
                                _buildSectionWithKey(
                                  sections[4], // purposesSection
                                  _buildPurposesSection(context),
                                ),

                                // Dettagli sul trattamento
                                _buildSectionWithKey(
                                  sections[5], // processingDetailsSection
                                  _buildServiceDetailsSection(context),
                                ),

                                // Cookie Policy
                                _buildSectionWithKey(
                                  sections[6], // cookiePolicySection
                                  _buildCookiePolicySection(context),
                                ),

                                // Ulteriori informazioni UE
                                _buildSectionWithKey(
                                  sections[7], // euInfoSection
                                  _buildEUSection(context),
                                ),

                                // Ulteriori informazioni
                                _buildSectionWithKey(
                                  sections[8], // additionalInfoSection
                                  _buildAdditionalInfoSection(context),
                                ),

                                // Definizioni e riferimenti
                                _buildSectionWithKey(
                                  sections[9], // definitionsSection
                                  _buildDefinitionsSection(context),
                                ),

                                // In case of problems
                                _buildSectionWithKey(
                                  sections[10], // inCaseOfProblems
                                  _buildHelpSection(context),
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

  Widget _buildRiepilogoSection(BuildContext context) {
    final t = Translations.of(context);

    final automaticDataCard = _buildSummaryCard(
      context,
      Icons.computer,
      t.legal.dataWeCollectAutomatically,
      t.legal.dataWeCollectAutomaticallyDesc,
      [
        t.legal.usageData,
        t.legal.ipAddress,
        t.legal.deviceInformation,
        t.legal.deviceIdentifiers,
        t.ui.language,
      ],
      ['Hetzner', 'Stripe'],
      t.legal.howWeUseThem,
      [t.legal.registrationAndAuth, t.legal.hostingAndBackend],
    );

    final providedDataCard = _buildSummaryCard(
      context,
      Icons.person_outline,
      t.legal.dataYouProvide,
      t.legal.dataYouProvideDesc,
      [
        t.ui.name,
        t.ui.surname,
        t.ui.email,
        t.ui.password,
        t.ui.birthDate,
        t.ui.birthTime,
        t.ui.birthPlace,
        t.legal.genderOptional,
        t.legal.phoneNumber,
        t.legal.billingAddress,
        t.legal.paymentInformation,
        t.legal.purchaseHistory,
      ],
      [
        'Stripe',
        'Apple',
        'OpenRouter',
        'Anthropic',
        'Google OAuth',
        'Google Maps',
        'IONOS',
      ],
      t.legal.howWeUseThem,
      [
        t.legal.registrationAndAuth,
        t.legal.backendApi,
        t.legal.paymentManagement,
        t.legal.placeSearchTitle,
        t.legal.emailSendingTitle,
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    t.legal.summarySection,
                    style: AppTextStyles.getH3Style(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              MediaQuery.of(context).size.width > 700
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: automaticDataCard),
                        const SizedBox(width: 24),
                        Expanded(child: providedDataCard),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        automaticDataCard,
                        const SizedBox(height: 24),
                        providedDataCard,
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    List<String> dataItems,
    List<String> thirdParties,
    String usageTitle,
    List<String> usageItems,
  ) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.getBodyStyle(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: AppTextStyles.getCaptionStyle(context)),
            const SizedBox(height: 16),
            // Data items - show all without abbreviation
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: dataItems.map((item) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface
                        .withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item,
                    style: AppTextStyles.getCaptionStyle(context),
                  ),
                );
              }).toList(),
            ),
            if (thirdParties.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                Translations.of(context).legal.trustedThirdParties,
                style: AppTextStyles.getCaptionStyle(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: thirdParties.map((party) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.business,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            party,
                            style: AppTextStyles.getCaptionStyle(context)
                                .copyWith(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              usageTitle,
              style: AppTextStyles.getCaptionStyle(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...usageItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
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

  Widget _buildSection(
    BuildContext context,
    IconData icon,
    String title,
    Widget content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.getH3Style(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTypesSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.folder_open,
      Translations.of(context).legal.dataTypesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translations.of(context).legal.dataTypesIntro,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Translations.of(context).ui.name,
              Translations.of(context).ui.surname,
              Translations.of(context).ui.email,
              Translations.of(context).ui.password,
              Translations.of(context).ui.birthDate,
              Translations.of(context).ui.birthTime,
              Translations.of(context).ui.birthPlace,
              Translations.of(context).legal.genderOptional,
              Translations.of(context).legal.phoneNumber,
              Translations.of(context).ui.language,
              Translations.of(context).legal.paymentInformation,
              Translations.of(context).legal.billingAddress,
              Translations.of(context).legal.purchaseHistory,
              Translations.of(context).legal.usageData,
              Translations.of(context).legal.communicatedDataDuringService,
              Translations.of(context).legal.ipAddress,
              Translations.of(context).legal.deviceInformation,
              Translations.of(context).legal.deviceIdentifiers,
            ].map((label) => _buildDataChip(context, label)).toList(),
          ),
          const SizedBox(height: 24),
          FormattedMarkdownContent(
            content: Translations.of(context).legal.dataTypesDetailedContent,
          ),
        ],
      ),
    );
  }

  Widget _buildProcessingMethodsSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.security,
      Translations.of(context).legal.processingMethodsTitle,
      FormattedMarkdownContent(
        content: Translations.of(context).legal.processingMethodsContent,
      ),
    );
  }

  Widget _buildPurposesSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.check_circle,
      Translations.of(context).legal.purposesSection,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translations.of(context).legal.purposesIntroText,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 16),
          _buildCheckItem(
            context,
            Translations.of(context).legal.paymentManagementTitle,
          ),
          _buildCheckItem(
            context,
            Translations.of(context).legal.hostingBackendTitle,
          ),
          _buildCheckItem(
            context,
            Translations.of(context).legal.backendApiTitle,
          ),
          _buildCheckItem(
            context,
            Translations.of(context).legal.authenticationTitle,
          ),
          _buildCheckItem(
            context,
            Translations.of(context).legal.placeSearchTitle,
          ),
          _buildCheckItem(
            context,
            Translations.of(context).legal.emailSendingTitle,
          ),
          const SizedBox(height: 16),
          Text(
            Translations.of(context).legal.purposesDetailedInfoText,
            style: AppTextStyles.getBodyStyle(context),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetailsSection(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildServiceDetailsHeader(context),

            // Payment Management
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.paymentManagementTitle,
              Translations.of(context).legal.paymentManagementDescription,
              [
                {
                  'name': 'Stripe',
                  'provider': 'Stripe Technology Europe Ltd',
                  'location': Translations.of(context).legal.europeanUnion,
                  'tags': [
                    Translations.of(context).ui.name,
                    Translations.of(context).ui.surname,
                    Translations.of(context).ui.email,
                    Translations.of(context).legal.phoneNumber,
                    Translations.of(context).legal.billingAddress,
                    Translations.of(context).legal.paymentInformation,
                    Translations.of(context).legal.purchaseHistory,
                    Translations.of(context).legal.deviceIdentifiers,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .stripeDescription,
                  'privacyUrl': 'https://stripe.com/privacy',
                },
                {
                  'name': 'Apple App Store',
                  'provider': 'Apple Distribution International Ltd.',
                  'location': Translations.of(context).legal.ireland,
                  'tags': [Translations.of(context).legal.purchaseHistory],
                  'description': Translations.of(context)
                      .legal
                      .appStoreDescription,
                  'privacyUrl': 'https://www.apple.com/legal/privacy/',
                },
              ],
            ),

            // Backend Infrastructure
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.hostingBackendTitle,
              Translations.of(context).legal.hostingBackendDescription,
              [
                {
                  'name': 'Hetzner',
                  'provider': 'Hetzner Online GmbH',
                  'location': Translations.of(context).legal.germany,
                  'tags': [
                    Translations.of(context)
                        .legal
                        .communicatedDataDuringService,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .hetznerDescription,
                  'privacyUrl': 'https://www.hetzner.com/legal/privacy-policy',
                },
              ],
            ),

            // Backend API
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.backendApiTitle,
              Translations.of(context).legal.backendApiDescription,
              [
                {
                  'name': 'OpenRouter',
                  'provider': 'OpenRouter, Inc.',
                  'location': Translations.of(context).legal.unitedStates,
                  'tags': [
                    Translations.of(context).legal.planetaryPositions,
                    Translations.of(context).legal.genderOptional,
                    Translations.of(context).ui.language,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .openRouterDescription,
                  'privacyUrl': 'https://openrouter.ai/privacy',
                },
                {
                  'name': Translations.of(context).legal.anthropicApiName,
                  'provider': 'Anthropic PBC',
                  'location': Translations.of(context).legal.unitedStates,
                  'tags': [
                    Translations.of(context).legal.planetaryPositions,
                    Translations.of(context).legal.genderOptional,
                    Translations.of(context).ui.language,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .anthropicApiDescription,
                  'privacyUrl': 'https://www.anthropic.com/legal/privacy',
                },
              ],
            ),

            // Registration and Authentication
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.authenticationTitle,
              Translations.of(context).legal.authenticationDescription,
              [
                {
                  'name': 'Google OAuth',
                  'provider': 'Google Ireland Limited',
                  'location': Translations.of(context).legal.ireland,
                  'tags': ['Google profile data'],
                  'description': Translations.of(context)
                      .legal
                      .googleOAuthDescription,
                  'privacyUrl': 'https://policies.google.com/privacy',
                },
                {
                  'name': 'Sign in with Apple',
                  'provider': 'Apple Distribution International Ltd.',
                  'location': Translations.of(context).legal.ireland,
                  'tags': [
                    Translations.of(context).ui.name,
                    Translations.of(context).ui.email,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .signInWithAppleDescription,
                  'privacyUrl': 'https://www.apple.com/legal/privacy/',
                },
              ],
            ),

            // Direct Registration
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.authenticationTitle,
              Translations.of(context).legal.authenticationDescription,
              [
                {
                  'name': Translations.of(context).legal.directRegistration,
                  'provider': 'AstroGods',
                  'location': Translations.of(context).legal.italy,
                  'tags': [
                    Translations.of(context).ui.name,
                    Translations.of(context).ui.surname,
                    Translations.of(context).ui.email,
                    Translations.of(context).ui.password,
                    Translations.of(context).ui.birthDate,
                    Translations.of(context).ui.birthTime,
                    Translations.of(context).ui.birthPlace,
                    Translations.of(context).legal.genderOptional,
                    Translations.of(context).ui.language,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .directRegistrationDescription,
                  'privacyUrl': '',
                },
              ],
            ),

            // Place Search
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.placeSearchTitle,
              Translations.of(context).legal.placeSearchDescription,
              [
                {
                  'name': 'Google Maps Platform',
                  'provider': 'Google Ireland Limited',
                  'location': Translations.of(context).legal.ireland,
                  'tags': [Translations.of(context).ui.birthPlace],
                  'description': Translations.of(context)
                      .legal
                      .googleMapsDescription,
                  'privacyUrl': 'https://policies.google.com/privacy',
                },
              ],
            ),

            // Email Delivery
            _buildServiceDetailCard(
              context,
              Translations.of(context).legal.emailSendingTitle,
              Translations.of(context).legal.emailSendingDescription,
              [
                {
                  'name': 'IONOS',
                  'provider': 'IONOS SE',
                  'location': Translations.of(context).legal.europeanUnion,
                  'tags': [
                    Translations.of(context).ui.name,
                    Translations.of(context).ui.email,
                  ],
                  'description': Translations.of(context)
                      .legal
                      .ionosDescription,
                  'privacyUrl':
                      'https://www.ionos.com/terms-gtc/privacy-policy/',
                },
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetailsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Icon(
            Icons.description,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              Translations.of(context).legal.processingDetailsSection,
              style: AppTextStyles.getH3Style(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDetailCard(
    BuildContext context,
    String title,
    String description,
    List<Map<String, dynamic>> services,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.getH4Style(context)),
          const SizedBox(height: 16),
          Text(description, style: AppTextStyles.getBodyStyle(context)),
          const SizedBox(height: 16),
          ...services.map((service) => _buildServiceItem(context, service)),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, Map<String, dynamic> service) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(16),
          childrenPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          expandedAlignment: Alignment.centerLeft,
          leading: Icon(
            Icons.business,
            color: Theme.of(context).colorScheme.onSurface
                .withValues(alpha: 0.6),
          ),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['name'],
                      style: AppTextStyles.getBodyStyle(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.apartment,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            service['provider'],
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            service['location'],
                            style: AppTextStyles.getCaptionStyle(context),
                          ),
                        ),
                      ],
                    ),
                    if ((service['tags'] as List).isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: (service['tags'] as List<String>)
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: AppTextStyles.getCaptionStyle(context)
                                      .copyWith(fontSize: 11),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.expand_more,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service['description'],
                  style: AppTextStyles.getBodyStyle(context),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                if (service['privacyUrl'] != null &&
                    service['privacyUrl'].toString().isNotEmpty) ...[
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        Translations.of(context).legal.providedByLabel,
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                      Text(
                        '${service['provider']} (${service['location']})',
                        style: AppTextStyles.getCaptionStyle(context),
                      ),
                      const SizedBox(width: 8),
                      Text('-', style: AppTextStyles.getCaptionStyle(context)),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () => _launchExternalUrl(service['privacyUrl']),
                        child: Text(
                          Translations.of(context).legal.privacyPolicy,
                          style: AppTextStyles.getCaptionStyle(context)
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCookiePolicySection(BuildContext context) {
    return _buildSection(
      context,
      Icons.cookie,
      Translations.of(context).legal.cookiePolicyTitle,
      FormattedMarkdownContent(
        content: Translations.of(context).legal.cookiePolicyContent,
      ),
    );
  }

  Widget _buildEUSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.flag,
      Translations.of(context).legal.euInfoTitle,
      FormattedMarkdownContent(
        content:
            '''
${Translations.of(context).legal.euInfoContent}

${Translations.of(context).legal.euExtendedContent}
        ''',
      ),
    );
  }

  Widget _buildAdditionalInfoSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.info,
      Translations.of(context).about.additionalInfoSection,
      FormattedMarkdownContent(
        content: Translations.of(context).about.additionalInfoContent,
      ),
    );
  }

  Widget _buildDefinitionsSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.menu_book,
      Translations.of(context).legal.definitionsSection,
      FormattedMarkdownContent(
        content: Translations.of(context).legal.definitionsContent,
      ),
    );
  }

  Widget _buildDataChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Text(label, style: AppTextStyles.getCaptionStyle(context)),
    );
  }

  Widget _buildCheckItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: AppTextStyles.getBodyStyle(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context) {
    return _buildSection(
      context,
      Icons.warning_amber_outlined,
      Translations.of(context).legal.inCaseOfProblems,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translations.of(context).legal.problemsDescription,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 8),
          Text(
            Translations.of(context).legal.doNotHesitateContact,
            style: AppTextStyles.getBodyStyle(context),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => openEmail(context, 'contact@astrogods.it'),
            icon: const Icon(Icons.email_outlined),
            label: Text(Translations.of(context).legal.contactUs),
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
              t.legal.dataControllerName,
              style: AppTextStyles.getCaptionStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  "${t.legal.dataControllerEmailLabel} ",
                  style: AppTextStyles.getCaptionStyle(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => openEmail(context, 'contact@astrogods.it'),
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
                      t.legal.summary,
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
