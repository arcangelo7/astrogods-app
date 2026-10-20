import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../constants/text_styles.dart';
import '../i18n/translations.g.dart';
import '../widgets/starry_night_background.dart';

class ReleaseNotesScreen extends StatelessWidget {
  const ReleaseNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final releases = [
      _ReleaseInfo('5.0.0', t.releaseNotes.releaseNotes_5_0_0),
      _ReleaseInfo('4.11.2', t.releaseNotes.releaseNotes_4_11_2),
      _ReleaseInfo('4.11.1', t.releaseNotes.releaseNotes_4_11_1),
      _ReleaseInfo('4.11.0', t.releaseNotes.releaseNotes_4_11_0),
      _ReleaseInfo('4.10.1', t.releaseNotes.releaseNotes_4_10_1),
      _ReleaseInfo('4.10.0', t.releaseNotes.releaseNotes_4_10_0),
      _ReleaseInfo('4.9.0', t.releaseNotes.releaseNotes_4_9_0),
      _ReleaseInfo('4.8.0', t.releaseNotes.releaseNotes_4_8_0),
      _ReleaseInfo('4.7.7', t.releaseNotes.releaseNotes_4_7_7),
      _ReleaseInfo('4.7.6', t.releaseNotes.releaseNotes_4_7_6),
      _ReleaseInfo('4.7.1', t.releaseNotes.releaseNotes_4_7_1),
      _ReleaseInfo('4.5.1', t.releaseNotes.releaseNotes_4_5_1),
      _ReleaseInfo('4.0.1', t.releaseNotes.releaseNotes_4_0_1),
      _ReleaseInfo('4.0.0', t.releaseNotes.releaseNotes_4_0_0),
      _ReleaseInfo('3.0.0', t.releaseNotes.releaseNotes_3_0_0),
      _ReleaseInfo('2.4.0', t.releaseNotes.releaseNotes_2_4_0),
      _ReleaseInfo('2.3.0', t.releaseNotes.releaseNotes_2_3_0),
      _ReleaseInfo('2.2.1', t.releaseNotes.releaseNotes_2_2_1),
      _ReleaseInfo('2.2.0', t.releaseNotes.releaseNotes_2_2_0),
      _ReleaseInfo('2.1.0', t.releaseNotes.releaseNotes_2_1_0),
      _ReleaseInfo('2.0.4', t.releaseNotes.releaseNotes_2_0_4),
      _ReleaseInfo('2.0.3', t.releaseNotes.releaseNotes_2_0_3),
      _ReleaseInfo('2.0.2', t.releaseNotes.releaseNotes_2_0_2),
      _ReleaseInfo('2.0.1', t.releaseNotes.releaseNotes_2_0_1),
    ];

    return Scaffold(
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
                  t.releaseNotes.releaseNotesTitle,
                  style: AppTextStyles.getH4Style(context),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                  ),
                  itemCount: releases.length,
                  itemBuilder: (context, index) {
                    final release = releases[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.releaseNotes.version(version: release.version),
                              style: AppTextStyles.getH5Style(context).copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              release.description,
                              style: AppTextStyles.getBodyStyle(context),
                            ),
                          ],
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
}

class _ReleaseInfo {
  final String version;
  final String description;

  _ReleaseInfo(this.version, this.description);
}
