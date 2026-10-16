import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/text_styles.dart';
import '../../../widgets/starry_night_background.dart';
import '../../../i18n/translations.g.dart';

class CodexAstronomyFundamentalsScreen extends StatelessWidget {
  const CodexAstronomyFundamentalsScreen({super.key});

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
                title: Text(t.codex.astronomyFundamentalsTitle),
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
                              Icons.blur_circular,
                              size: 32,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                t.codex.astronomyFundamentalsTitle,
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
                            Icons.language,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.celestialSphereTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/astronomy-fundamentals/celestial-sphere',
                        ),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.swap_calls,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.equatorEclipticTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/astronomy-fundamentals/equator-ecliptic',
                        ),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          child: Icon(
                            Icons.rotate_right,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        title: Text(
                          t.codex.precessionTitle,
                          style: AppTextStyles.getBodyLargeStyle(context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onTap: () => context.push(
                          '/codex/astronomy-fundamentals/precession',
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
