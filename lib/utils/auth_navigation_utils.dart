import 'dart:convert';

import 'package:material_ui/material_ui.dart' show TimeOfDay;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/router.dart';
import '../services/birth_chart_service.dart';
import 'date_utils.dart';

Future<void> saveReturnUrl(String url) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('redirect_after_login', url);
}

Future<void> navigateAfterAuth() async {
  final prefs = await SharedPreferences.getInstance();

  // Priority 0: Generic return URL
  final returnUrl = prefs.getString('redirect_after_login');
  if (returnUrl != null) {
    await prefs.remove('redirect_after_login');
    appRouter.go(returnUrl);
    return;
  }

  // Priority 1: Pending preview redirect
  final hasPendingPreview = prefs.getBool('redirect_to_reading') ?? false;
  if (hasPendingPreview) {
    final birthChartJson = prefs.getString('pending_birth_chart');
    if (birthChartJson != null) {
      final birthChartData = jsonDecode(birthChartJson) as Map<String, dynamic>;
      final birthChartId = birthChartData['id'];

      await prefs.remove('pending_birth_chart');
      await prefs.remove('redirect_to_reading');

      appRouter.go(
        '/birth-chart-reading/$birthChartId',
        extra: {'birthChart': birthChartData},
      );
      return;
    }
    await prefs.remove('redirect_to_reading');
  }

  // Priority 2: Registration data
  final registrationDataJson = prefs.getString('pending_registration_data');
  if (registrationDataJson != null) {
    await prefs.remove('pending_registration_data');
    final data = jsonDecode(registrationDataJson) as Map<String, dynamic>;

    final hasCompleteBirthData =
        data['birthDate'] != null &&
        data['birthPlaceId'] != null &&
        (data['birthTimeHour'] != null || data['unknownTime'] == true);

    if (hasCompleteBirthData) {
      await _createBirthChartAndNavigate(data);
    } else if (data.isNotEmpty) {
      appRouter.go('/personality', extra: data);
    } else {
      appRouter.go('/');
    }
    return;
  }

  appRouter.go('/');
}

Future<void> _createBirthChartAndNavigate(Map<String, dynamic> data) async {
  final birthChartService = BirthChartService();

  try {
    final hasBirthTime =
        data['birthTimeHour'] != null && data['unknownTime'] != true;
    final birthTime = hasBirthTime
        ? TimeOfDay(
            hour: data['birthTimeHour'],
            minute: data['birthTimeMinute'] ?? 0,
          )
        : const TimeOfDay(hour: 12, minute: 0);

    final birthChart = await birthChartService.createBirthChart(
      givenName: data['givenName'] ?? '',
      familyName: data['familyName'] ?? '',
      date: DateUtils.toBirthDateTimeIso(
        DateTime.parse(data['birthDate']),
        birthTime,
      ),
      placeId: data['birthPlaceId'],
      place: data['birthPlace'] ?? '',
      unknownTime: data['unknownTime'] ?? false,
      timeFold: data['birthTimeFold'],
    );

    await birthChartService.calculateBirthChart(birthChart.id);

    appRouter.go(
      '/birth-chart-reading/${birthChart.id}',
      extra: {'birthChart': birthChart.toJson()},
    );
  } catch (e) {
    appRouter.go('/personality', extra: data);
  } finally {
    birthChartService.dispose();
  }
}

Future<void> saveRegistrationDataForRedirect(Map<String, dynamic> data) async {
  if (data.isEmpty) return;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('pending_registration_data', jsonEncode(data));
}
