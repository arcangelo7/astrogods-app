import 'package:material_ui/material_ui.dart';

import '../models/birth_chart.dart';
import '../constants/text_styles.dart';
import '../utils/date_utils.dart' as date_utils;
import '../i18n/translations.g.dart';

class BirthChartHeader extends StatelessWidget {
  final BirthChart birthChart;

  const BirthChartHeader({super.key, required this.birthChart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Translations.of(context).ui.birthChartFor(name: birthChart.fullName),
          style: AppTextStyles.getH3Style(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          date_utils.DateUtils.formatBirthDateTime(context, birthChart),
          style: AppTextStyles.getSubtitleMediumStyle(context),
          textAlign: TextAlign.center,
        ),
        if (birthChart.place != null) ...[
          const SizedBox(height: 8),
          Text(
            birthChart.place!,
            style: AppTextStyles.getSubtitleMediumStyle(context),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
