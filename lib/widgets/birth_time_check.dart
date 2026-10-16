import 'package:material_ui/material_ui.dart';

import '../constants/text_styles.dart';
import '../i18n/translations.g.dart';

class BirthTimeController extends ChangeNotifier {
  BirthTimeController([this._fold]);

  String? _missingMessage;
  String? _repeatedMessage;
  int? _fold;

  String? get missingMessage => _missingMessage;
  String? get repeatedMessage => _repeatedMessage;
  int? get fold => _fold;

  bool handle(String? errorKey, String message) {
    switch (errorKey) {
      case 'birth_time.nonexistent':
        _missingMessage = message;
      case 'birth_time.ambiguous':
        _repeatedMessage = message;
      default:
        return false;
    }
    notifyListeners();
    return true;
  }

  void choose(int fold) {
    _fold = fold;
    notifyListeners();
  }

  void reset() {
    _missingMessage = null;
    _repeatedMessage = null;
    _fold = null;
    notifyListeners();
  }
}

class RepeatedTimeChoice extends StatelessWidget {
  final BirthTimeController controller;

  const RepeatedTimeChoice({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final message = controller.repeatedMessage;
        if (message == null) return const SizedBox.shrink();
        final t = Translations.of(context);
        final colorScheme = Theme.of(context).colorScheme;
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Material(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: colorScheme.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: AppTextStyles.getBodyStyle(context)),
                  RadioGroup<int>(
                    groupValue: controller.fold,
                    onChanged: (fold) => controller.choose(fold!),
                    child: Column(
                      children: [
                        RadioListTile<int>(
                          value: 0,
                          title: Text(
                            t.ui.repeatedTimeFirst,
                            style: AppTextStyles.getBodyStyle(context),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                        RadioListTile<int>(
                          value: 1,
                          title: Text(
                            t.ui.repeatedTimeSecond,
                            style: AppTextStyles.getBodyStyle(context),
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
