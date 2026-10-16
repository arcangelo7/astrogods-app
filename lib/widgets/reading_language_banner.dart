import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../config/router.dart' show AppRouter;
import '../i18n/translations.g.dart';

class ReadingLanguageBanner extends StatelessWidget {
  final String readingLanguage;
  final bool hasSubscription;
  final bool hasPremiumSubscription;
  final bool requiresPremium;
  final bool isLoadingSubscription;
  final VoidCallback? onRegenerate;
  final bool isRegenerating;

  const ReadingLanguageBanner({
    super.key,
    required this.readingLanguage,
    required this.hasSubscription,
    this.hasPremiumSubscription = false,
    this.requiresPremium = false,
    this.isLoadingSubscription = false,
    this.onRegenerate,
    this.isRegenerating = false,
  });

  bool get _canRegenerate {
    if (requiresPremium) {
      return hasPremiumSubscription;
    }
    return hasSubscription;
  }

  String _getLanguageName(BuildContext context, String code) {
    final t = Translations.of(context);
    switch (code.toLowerCase()) {
      case 'it':
        return t.ui.languageItalian;
      case 'en':
        return t.ui.languageEnglish;
      default:
        return code.toUpperCase();
    }
  }

  Widget _buildSmallLoader(Color color) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(strokeWidth: 2, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLang = Localizations.localeOf(context).languageCode;
    if (readingLanguage == currentLang) {
      return const SizedBox.shrink();
    }

    final t = Translations.of(context);
    final readingLangName = _getLanguageName(context, readingLanguage);
    final currentLangName = _getLanguageName(context, currentLang);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline
                  .withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.translate,
                    size: 18,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      t.ui.readingGeneratedIn(language: readingLangName),
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              if (_canRegenerate && onRegenerate != null) ...[
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: isRegenerating ? null : onRegenerate,
                    child: isRegenerating
                        ? _buildSmallLoader(
                            Theme.of(context).colorScheme.primary,
                          )
                        : Text(
                            t.ui.regenerateInLanguage(
                              language: currentLangName,
                            ),
                          ),
                  ),
                ),
              ],
              if (isLoadingSubscription) ...[
                const SizedBox(height: 8),
                Center(
                  child: _buildSmallLoader(
                    Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ] else if (!_canRegenerate) ...[
                const SizedBox(height: 8),
                Text(
                  requiresPremium
                      ? t.ui.premiumRequiredForRegeneration
                      : t.ui.subscriptionRequiredForRegeneration,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => context.push(AppRouter.subscriptionPlans),
                    child: Text(t.ui.viewPlans),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
