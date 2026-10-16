import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../i18n/translations.g.dart';
import '../constants/text_styles.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/gradient_button.dart';
import '../widgets/location_search_field.dart';
import '../widgets/mystical_text_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';
import '../widgets/unknown_time_checkbox.dart';
import '../widgets/birth_time_check.dart';
import '../utils/date_utils.dart' as app_date_utils;
import '../widgets/mystical_checkbox.dart';
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../models/location.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../providers/auth_provider.dart';

class PersonalityScreen extends StatefulWidget {
  final Map<String, dynamic>? prefillData;

  const PersonalityScreen({super.key, this.prefillData});

  @override
  State<PersonalityScreen> createState() => _PersonalityScreenState();
}

class _PersonalityScreenState extends State<PersonalityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _birthTimeController = TextEditingController();
  bool _dontKnowBirthTime = false;
  bool _isLoading = false;
  bool _chartOnly = false;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  PlaceDetails? _selectedLocation;
  late final BirthChartService _birthChartService;
  late final BirthTimeController _birthTime;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _birthTime = BirthTimeController(
      widget.prefillData?['birthTimeFold'] as int?,
    );
    _applyPrefillData();
  }

  void _applyPrefillData() {
    final prefillData = widget.prefillData;
    if (prefillData == null) return;

    if (prefillData['givenName'] != null) {
      _firstNameController.text = prefillData['givenName'] as String;
    }
    if (prefillData['familyName'] != null) {
      _lastNameController.text = prefillData['familyName'] as String;
    }
    if (prefillData['birthDate'] != null) {
      _selectedDate = DateTime.parse(prefillData['birthDate'] as String);
      _birthDateController.text =
          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
    }
    if (prefillData['birthTimeHour'] != null &&
        prefillData['birthTimeMinute'] != null) {
      final hour = prefillData['birthTimeHour'] as int;
      final minute = prefillData['birthTimeMinute'] as int;
      _selectedTime = TimeOfDay(hour: hour, minute: minute);
      _birthTimeController.text =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }
    if (prefillData['birthPlace'] != null &&
        prefillData['birthPlaceId'] != null) {
      final birthPlace = prefillData['birthPlace'] as String;
      _birthPlaceController.text = birthPlace;
      _selectedLocation = PlaceDetails(
        placeId: prefillData['birthPlaceId'] as String,
        name: birthPlace,
        formattedAddress: birthPlace,
      );
    }
    if (prefillData['unknownTime'] == true) {
      _dontKnowBirthTime = true;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _birthTimeController.dispose();
    _birthChartService.dispose();
    _birthTime.dispose();
    super.dispose();
  }

  Future<void> _submitBirthChart() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      SnackbarUtils.showErrorSnackBar(
        context,
        Translations.of(context).ui.pleaseSelectBirthDate,
      );
      return;
    }

    if (_selectedLocation == null) {
      SnackbarUtils.showErrorSnackBar(
        context,
        Translations.of(context).ui.pleaseSelectBirthPlace,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Create birth chart with place_id (backend will do geocoding)
      final birthChart = await _birthChartService.createBirthChart(
        givenName: _firstNameController.text.trim(),
        familyName: _lastNameController.text.trim(),
        date: app_date_utils.DateUtils.toBirthDateTimeIso(
          _selectedDate!,
          _dontKnowBirthTime
              ? const TimeOfDay(hour: 12, minute: 0)
              : _selectedTime!,
        ),
        placeId: _selectedLocation!.placeId,
        place: _selectedLocation!.formattedAddress,
        unknownTime: _dontKnowBirthTime,
        timeFold: _birthTime.fold,
        chartOnly: _chartOnly,
      );

      await _birthChartService.calculateBirthChart(birthChart.id);

      if (mounted) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        if (_chartOnly || authProvider.isAuthenticated) {
          context.push(
            '/birth-chart-reading/${birthChart.id}',
            extra: {'birthChart': birthChart.toJson(), 'chartOnly': _chartOnly},
          );
        } else {
          context.push(
            '/birth-chart-preview/${birthChart.id}',
            extra: birthChart.toJson(),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        if (e is ApiException && !_birthTime.handle(e.errorKey, e.message)) {
          if (e.isSubscriptionError) {
            SnackbarUtils.showInfo(context, e.message);
            context.go('/subscription-plans');
          } else {
            SessionUtils.handleApiException(
              context,
              e,
              (message) =>
                  SnackbarUtils.showCopyableErrorSnackBar(context, message),
            );
          }
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StarryNightBackground(
      showPlanet: false,
      subtle: true,
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Sottrai l'altezza della bottom navigation (circa 80px) per centrare solo nella porzione visibile
            final availableHeight = constraints.maxHeight - 80.0;
            final bottomPadding = MediaQuery.of(context).padding.bottom;
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 8.0,
                bottom: 100.0 + bottomPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: availableHeight - 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),

                      Text(
                        Translations.of(context).ui.unveilHeart,
                        style: AppTextStyles.getH4Style(context),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 40),

                      // Use vertical layout on small screens
                      MediaQuery.of(context).size.width < 600
                          ? Column(
                              children: [
                                MysticalTextField(
                                  controller: _firstNameController,
                                  labelText: Translations.of(context)
                                      .ui
                                      .firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return Translations.of(context)
                                          .ui
                                          .pleaseEnterFirstName;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                MysticalTextField(
                                  controller: _lastNameController,
                                  labelText: Translations.of(context)
                                      .ui
                                      .lastName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return Translations.of(context)
                                          .ui
                                          .pleaseEnterLastName;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: MysticalTextField(
                                    controller: _firstNameController,
                                    labelText: Translations.of(context)
                                        .ui
                                        .firstName,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return Translations.of(context)
                                            .ui
                                            .pleaseEnterFirstName;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: MysticalTextField(
                                    controller: _lastNameController,
                                    labelText: Translations.of(context)
                                        .ui
                                        .lastName,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return Translations.of(context)
                                            .ui
                                            .pleaseEnterLastName;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                      const SizedBox(height: 20),

                      LocationSearchField(
                        controller: _birthPlaceController,
                        labelText: Translations.of(context).ui.birthPlace,
                        language: Localizations.localeOf(context).languageCode,
                        validator: (value) {
                          if (_selectedLocation == null) {
                            return Translations.of(context)
                                .ui
                                .pleaseSelectBirthPlace;
                          }
                          return null;
                        },
                        onLocationSelected: (PlaceDetails? location) {
                          setState(() {
                            _selectedLocation = location;
                          });
                          _birthTime.reset();
                        },
                      ),

                      const SizedBox(height: 20),

                      // Use vertical layout on small screens
                      MediaQuery.of(context).size.width < 600
                          ? Column(
                              children: [
                                MysticalDatePickerField(
                                  controller: _birthDateController,
                                  selectedDate: _selectedDate,
                                  labelText: Translations.of(context)
                                      .ui
                                      .birthDate,
                                  onDateSelected: (date) {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                    _birthTime.reset();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return Translations.of(context)
                                          .ui
                                          .pleaseSelectBirthDate;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                MysticalTimePickerField(
                                  controller: _birthTimeController,
                                  birthTime: _birthTime,
                                  selectedTime: _selectedTime,
                                  labelText: Translations.of(context)
                                      .ui
                                      .birthTime,
                                  onTimeSelected: (time) {
                                    setState(() {
                                      _selectedTime = time;
                                    });
                                    _birthTime.reset();
                                  },
                                  enabled: !_dontKnowBirthTime,
                                  validator: (value) {
                                    if (!_dontKnowBirthTime &&
                                        (value == null || value.isEmpty)) {
                                      return Translations.of(context)
                                          .ui
                                          .pleaseSelectBirthTime;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: MysticalDatePickerField(
                                    controller: _birthDateController,
                                    selectedDate: _selectedDate,
                                    labelText: Translations.of(context)
                                        .ui
                                        .birthDate,
                                    onDateSelected: (date) {
                                      setState(() {
                                        _selectedDate = date;
                                      });
                                      _birthTime.reset();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return Translations.of(context)
                                            .ui
                                            .pleaseSelectBirthDate;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: MysticalTimePickerField(
                                    controller: _birthTimeController,
                                    birthTime: _birthTime,
                                    selectedTime: _selectedTime,
                                    labelText: Translations.of(context)
                                        .ui
                                        .birthTime,
                                    onTimeSelected: (time) {
                                      setState(() {
                                        _selectedTime = time;
                                      });
                                      _birthTime.reset();
                                    },
                                    enabled: !_dontKnowBirthTime,
                                    validator: (value) {
                                      if (!_dontKnowBirthTime &&
                                          (value == null || value.isEmpty)) {
                                        return Translations.of(context)
                                            .ui
                                            .pleaseSelectBirthTime;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                      RepeatedTimeChoice(controller: _birthTime),

                      const SizedBox(height: 24),

                      UnknownTimeCheckbox(
                        value: _dontKnowBirthTime,
                        onChanged: (value) {
                          setState(() {
                            _dontKnowBirthTime = value;
                            if (_dontKnowBirthTime) {
                              _birthTimeController.clear();
                            }
                          });
                          _birthTime.reset();
                        },
                      ),

                      const SizedBox(height: 16),

                      MysticalCheckbox(
                        title: Translations.of(context).ui.chartOnlyMode,
                        value: _chartOnly,
                        onChanged: (value) {
                          setState(() {
                            _chartOnly = value;
                          });
                        },
                      ),

                      const SizedBox(height: 24),

                      GradientButton(
                        text: _isLoading
                            ? Translations.of(context).ui.analyzing
                            : Translations.of(context).ui.read.toUpperCase(),
                        onPressed: !_isLoading ? _submitBirthChart : () {},
                      ),

                      const SizedBox(height: 24),

                      // Info text
                      Text(
                        Translations.of(context).ui.birthChartDescription,
                        style: AppTextStyles.getCaptionStyle(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface
                              .withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
