import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/text_styles.dart';
import '../../../../widgets/starry_night_background.dart';
import '../../../../i18n/translations.g.dart';

class CodexUnderstandingPlacidoScreen extends StatelessWidget {
  const CodexUnderstandingPlacidoScreen({super.key});

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
                      context.go('/codex/domification');
                    }
                  },
                ),
                title: Text(t.codex.understandingPlacidoTitle),
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
                              Icons.school,
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                t.codex.understandingPlacidoTitle,
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
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.placidoIntroTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/domification/understanding-placido/introduction',
                        ),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.explore,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.latitudeSkyTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/domification/understanding-placido/latitude-sky',
                        ),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.timelapse,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.semidiurnalArcsTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/domification/understanding-placido/semidiurnal-arcs',
                        ),
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
