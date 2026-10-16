import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

import '../i18n/translations.g.dart';
import '../models/birth_chart.dart';

class DateUtils {
  static String formatBirthDateTime(
    BuildContext context,
    BirthChart birthChart,
  ) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormatter = DateFormat('d MMMM y', locale);
    final timeFormatter = DateFormat('HH:mm', locale);

    String formattedDate = dateFormatter.format(birthChart.date);
    String result = formattedDate;

    if (!birthChart.unknownTime) {
      result +=
          ' ${Translations.of(context).ui.at} ${timeFormatter.format(birthChart.date)}';
    }

    return result;
  }

  // Built from the chosen values so the device time zone cannot shift a
  // time that does not exist there; the backend applies the birthplace rules.
  static String toBirthDateTimeIso(DateTime date, TimeOfDay time) {
    final day = DateFormat('yyyy-MM-dd').format(date);
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '${day}T$hour:$minute:00';
  }

  static String formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    final dateFormatter = DateFormat('d MMMM y', locale);
    return dateFormatter.format(date);
  }

  static String formatTime(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    final timeFormatter = DateFormat('HH:mm', locale);
    return timeFormatter.format(dateTime);
  }

  static String formatMonthYear(BuildContext context, int month, int year) {
    final locale = Localizations.localeOf(context).languageCode;
    final date = DateTime(year, month);
    final formatter = DateFormat('MMMM y', locale);
    return formatter.format(date);
  }
}
