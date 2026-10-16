import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/text_styles.dart';
import '../../../widgets/starry_night_background.dart';
import '../../../i18n/translations.g.dart';

class CodexDomificationScreen extends StatelessWidget {
  const CodexDomificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
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
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/codex');
                    }
                  },
                ),
                title: Text(t.codex.domificationSectionTitle),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.temple_hindu,
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                t.codex.domificationSectionTitle,
                                style: AppTextStyles.getH4Style(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.design_services,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.understandingPlacidoTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/domification/understanding-placido',
                        ),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.architecture,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.domificationArticleTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () =>
                            context.push('/codex/domification/why-vehlow'),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.auto_stories,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.bookOfCaverns,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () =>
                            context.push('/codex/domification/book-of-caves'),
                      ),
                      const Divider(height: 1),
                      const SizedBox(height: 32),
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
}
