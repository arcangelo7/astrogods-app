import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/starry_night_background.dart';
import '../../../../widgets/formatted_markdown_content.dart';
import '../../../../constants/text_styles.dart';
import '../../../../i18n/translations.g.dart';

class CodexLatitudeSkyScreen extends StatelessWidget {
  const CodexLatitudeSkyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(t.codex.latitudeSkyTitle),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/codex/domification/understanding-placido');
                    }
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: _getConstrainedWidth(context),
                            constraints:
                                _getConstrainedWidth(context) != double.infinity
                                ? const BoxConstraints(maxWidth: 700.0)
                                : null,
                            child: Text(
                              t.codex.latitudeSkyTitle,
                              style: AppTextStyles.getH3Style(context),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        FormattedMarkdownContent(
                          content: t.codex.latitudeSkyContent,
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Container(
                            width: _getConstrainedWidth(context),
                            constraints:
                                _getConstrainedWidth(context) != double.infinity
                                ? const BoxConstraints(maxWidth: 700.0)
                                : null,
                            child: Card.filled(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () => context.push(
                                  '/codex/domification/understanding-placido/semidiurnal-arcs',
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          t.codex.nextSection(
                                            title: t.codex.semidiurnalArcsTitle,
                                          ),
                                          style:
                                              AppTextStyles.getBodyLargeStyle(
                                                context,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
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

  double _getConstrainedWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxTextWidth = 700.0;
    return screenWidth > maxTextWidth ? maxTextWidth : double.infinity;
  }
}
