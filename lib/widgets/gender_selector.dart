import 'package:material_ui/material_ui.dart';

import '../constants/text_styles.dart';
import '../i18n/translations.g.dart';
import 'choice_chip_group.dart';

const genders = ['female', 'male', 'non_binary'];

String genderLabel(BuildContext context, String? gender) {
  final t = Translations.of(context);
  return switch (gender) {
    'female' => t.ui.genderWoman,
    'male' => t.ui.genderMan,
    'non_binary' => t.ui.genderNonBinary,
    null => t.ui.genderPreferNotToSay,
    _ => throw ArgumentError.value(gender, 'gender'),
  };
}

class GenderSelector extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const GenderSelector({super.key, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translations.of(context).ui.gender,
            style: AppTextStyles.getFormLabelStyle(context),
          ),
          const SizedBox(height: 8),
          ChoiceChipGroup<String?>(
            options: [
              for (final gender in [...genders, null])
                ChoiceChipOption(
                  value: gender,
                  label: genderLabel(context, gender),
                ),
            ],
            selected: value,
            onSelected: onChanged,
          ),
        ],
      ),
    );
  }
}
