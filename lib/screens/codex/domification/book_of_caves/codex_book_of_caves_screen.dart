import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/cavern_list.dart';
import '../../../../widgets/starry_night_background.dart';
import '../../../../constants/text_styles.dart';
import '../../../../i18n/translations.g.dart';

class CodexBookOfCavesScreen extends StatelessWidget {
  const CodexBookOfCavesScreen({super.key});

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
                title: Text(t.codex.bookOfCaverns),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Card.filled(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => context.push(
                              '/codex/domification/book-of-caves/introduction',
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      t.codex.readMethodologicalNote,
                                      style: AppTextStyles.getBodyLargeStyle(
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
                      const CavernList(),
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
