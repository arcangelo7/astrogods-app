import 'package:material_ui/material_ui.dart';

import '../i18n/translations.g.dart';
import 'mystical_checkbox.dart';

class UnknownTimeCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final bool enabled;

  const UnknownTimeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return MysticalCheckbox(
      title: t.ui.dontKnowBirthTime,
      subtitle: value ? t.ui.withoutBirthTimeWarning : null,
      value: value,
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
