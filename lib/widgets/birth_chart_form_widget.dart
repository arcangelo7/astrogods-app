import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';

import '../i18n/translations.g.dart';
import '../models/birth_chart.dart';
import '../models/location.dart';
import '../widgets/mystical_text_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';
import '../widgets/location_search_field.dart';
import '../widgets/unknown_time_checkbox.dart';
import '../widgets/birth_time_check.dart';
import '../utils/date_utils.dart' as app_date_utils;

class BirthChartFormWidget extends StatefulWidget {
  final BirthChart? initialBirthChart;
  final VoidCallback? onChanged;
  final bool isEditMode;

  const BirthChartFormWidget({
    super.key,
    this.initialBirthChart,
    this.onChanged,
    this.isEditMode = false,
  });

  @override
  State<BirthChartFormWidget> createState() => BirthChartFormWidgetState();
}

// Make the state class public so parent widgets can access the data
class BirthChartFormWidgetState extends State<BirthChartFormWidget> {
  late final TextEditingController _givenNameController;
  late final TextEditingController _familyNameController;
  late final TextEditingController _placeController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;

  late DateTime _selectedDate;
  late TimeOfDay? _selectedTime;
  late bool _unknownTime;
  PlaceDetails? _selectedLocation;
  late final BirthTimeController _birthTime;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final birthChart = widget.initialBirthChart;

    _givenNameController = TextEditingController(
      text: birthChart?.givenName ?? '',
    );
    _familyNameController = TextEditingController(
      text: birthChart?.familyName ?? '',
    );
    _placeController = TextEditingController(text: birthChart?.place ?? '');

    _selectedDate = birthChart?.date ?? DateTime.now();
    _unknownTime = birthChart?.unknownTime ?? false;
    _birthTime = BirthTimeController(birthChart?.timeFold);

    if (!_unknownTime && birthChart != null) {
      _selectedTime = TimeOfDay.fromDateTime(birthChart.date);
      _timeController = TextEditingController();
    } else {
      _selectedTime = null;
      _timeController = TextEditingController();
    }

    _dateController = TextEditingController();

    _givenNameController.addListener(_onFieldChanged);
    _familyNameController.addListener(_onFieldChanged);
    _placeController.addListener(_onFieldChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _updateControllersWithContext();
      _isInitialized = true;
    }
  }

  void _updateControllersWithContext() {
    _dateController.text = DateFormat.yMMMd(
      Localizations.localeOf(context).toString(),
    ).format(_selectedDate);

    if (_selectedTime != null) {
      _timeController.text = _selectedTime!.format(context);
    }
  }

  void _onFieldChanged() {
    widget.onChanged?.call();
  }

  @override
  void dispose() {
    _givenNameController.dispose();
    _familyNameController.dispose();
    _placeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _birthTime.dispose();
    super.dispose();
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        _selectedTime?.hour ?? 12,
        _selectedTime?.minute ?? 0,
      );
      _dateController.text = DateFormat.yMMMd(
        Localizations.localeOf(context).toString(),
      ).format(_selectedDate);
    });
    _birthTime.reset();
    _onFieldChanged();
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      _selectedTime = time;
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        time.hour,
        time.minute,
      );
      _timeController.text = time.format(context);
    });
    _birthTime.reset();
    _onFieldChanged();
  }

  void _onLocationSelected(PlaceDetails? location) {
    setState(() {
      _selectedLocation = location;
    });
    _birthTime.reset();
    _onFieldChanged();
  }

  void _onUnknownTimeChanged(bool value) {
    setState(() {
      _unknownTime = value;
      if (value) {
        _selectedTime = null;
        _timeController.clear();
      }
    });
    _birthTime.reset();
    _onFieldChanged();
  }

  String? _validateGivenName(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.ui.givenNameRequired;
    }
    return null;
  }

  String? _validateFamilyName(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.ui.familyNameRequired;
    }
    return null;
  }

  String? _validatePlace(String? value) {
    final t = Translations.of(context);
    if (widget.isEditMode) {
      if (_selectedLocation == null &&
          (value == null || value.trim().isEmpty)) {
        return t.ui.pleaseSelectBirthPlace;
      }
    } else {
      if (_selectedLocation == null) {
        return t.ui.pleaseSelectBirthPlace;
      }
    }
    return null;
  }

  String? _validateLocationSelected() {
    final t = Translations.of(context);
    if (widget.isEditMode) {
      if (_selectedLocation == null && _placeController.text.trim().isEmpty) {
        return t.ui.pleaseSelectBirthPlace;
      }
    } else {
      if (_selectedLocation == null) {
        return t.ui.pleaseSelectBirthPlace;
      }
    }
    return null;
  }

  String? _validateDate(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.ui.pleaseFillAllFields;
    }
    return null;
  }

  String? _validateTime(String? value) {
    final t = Translations.of(context);
    if (!_unknownTime && _selectedTime == null) {
      return t.ui.birthTimeRequired;
    }
    return null;
  }

  String get givenName => _givenNameController.text.trim();
  String get familyName => _familyNameController.text.trim();
  String get place => _placeController.text.trim();
  DateTime get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  bool get unknownTime => _unknownTime;
  PlaceDetails? get selectedLocation => _selectedLocation;
  BirthTimeController get birthTime => _birthTime;
  String get birthDateTime => app_date_utils.DateUtils.toBirthDateTimeIso(
    _selectedDate,
    _unknownTime ? const TimeOfDay(hour: 12, minute: 0) : _selectedTime!,
  );

  bool isValid() {
    return _validateGivenName(givenName) == null &&
        _validateFamilyName(familyName) == null &&
        _validateLocationSelected() == null &&
        _validateDate(_dateController.text) == null &&
        _validateTime(null) == null;
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MysticalTextField(
          controller: _givenNameController,
          labelText: t.ui.firstName,
          validator: _validateGivenName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        MysticalTextField(
          controller: _familyNameController,
          labelText: t.ui.lastName,
          validator: _validateFamilyName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        MysticalDatePickerField(
          controller: _dateController,
          selectedDate: _selectedDate,
          labelText: t.ui.birthDate,
          onDateSelected: _onDateSelected,
          validator: _validateDate,
          firstDate: DateTime(1800),
          lastDate: DateTime.now(),
        ),
        const SizedBox(height: 16),
        MysticalTimePickerField(
          controller: _timeController,
          birthTime: _birthTime,
          selectedTime: _selectedTime,
          labelText: t.ui.birthTime,
          onTimeSelected: _onTimeSelected,
          enabled: !_unknownTime,
          validator: _validateTime,
        ),
        RepeatedTimeChoice(controller: _birthTime),
        const SizedBox(height: 16),
        UnknownTimeCheckbox(
          value: _unknownTime,
          onChanged: _onUnknownTimeChanged,
        ),
        const SizedBox(height: 16),
        LocationSearchField(
          controller: _placeController,
          labelText: t.ui.birthPlace,
          onLocationSelected: _onLocationSelected,
          validator: _validatePlace,
        ),
      ],
    );
  }
}
