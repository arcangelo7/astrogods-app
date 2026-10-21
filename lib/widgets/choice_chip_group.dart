import 'package:material_ui/material_ui.dart';

class ChoiceChipOption<T> {
  final T value;
  final String label;
  final Widget? avatar;

  const ChoiceChipOption({
    required this.value,
    required this.label,
    this.avatar,
  });
}

class ChoiceChipGroup<T> extends StatelessWidget {
  final List<ChoiceChipOption<T>> options;
  final T selected;
  final ValueChanged<T> onSelected;

  const ChoiceChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final option in options)
          ChoiceChip(
            avatar: option.avatar == null || option.value != selected
                ? option.avatar
                : IconTheme.merge(
                    data: IconThemeData(color: onPrimary),
                    child: option.avatar!,
                  ),
            label: Text(option.label),
            labelStyle: option.value == selected
                ? TextStyle(color: onPrimary)
                : null,
            selected: option.value == selected,
            onSelected: (_) => onSelected(option.value),
          ),
      ],
    );
  }
}
