import 'package:material_ui/material_ui.dart';

import '../i18n/translations.g.dart';
import '../models/birth_chart.dart';
import '../services/api_client.dart';
import '../services/birth_chart_service.dart';
import '../services/reading_state_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_form_widget.dart';
import '../widgets/generic_dialog.dart';

class EditBirthChartDialog extends StatefulWidget {
  final BirthChart birthChart;
  final VoidCallback? onUpdated;

  const EditBirthChartDialog({
    super.key,
    required this.birthChart,
    this.onUpdated,
  });

  @override
  State<EditBirthChartDialog> createState() => _EditBirthChartDialogState();
}

class _EditBirthChartDialogState extends State<EditBirthChartDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<BirthChartFormWidgetState> _formStateKey =
      GlobalKey<BirthChartFormWidgetState>();
  late BirthChartFormWidget _formWidget;
  late BirthChartService _birthChartService;

  bool _isLoading = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService();
    _formWidget = BirthChartFormWidget(
      key: _formStateKey,
      initialBirthChart: widget.birthChart,
      onChanged: _onFieldChanged,
      isEditMode: true,
    );
  }

  @override
  void dispose() {
    _birthChartService.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      _hasChanges = _hasFormChanged();
    });
  }

  bool _hasFormChanged() {
    final formState = _formStateKey.currentState;
    if (formState == null) return false;

    return formState.givenName != widget.birthChart.givenName ||
        formState.familyName != widget.birthChart.familyName ||
        formState.gender != widget.birthChart.gender ||
        formState.place != widget.birthChart.place ||
        _birthTimeChanged(formState);
  }

  // Compares the chosen values, since a DateTime built in the device time
  // zone shifts times that do not exist there
  bool _birthTimeChanged(BirthChartFormWidgetState formState) {
    final saved = widget.birthChart.date;
    final chosen = formState.selectedDate;
    return chosen.year != saved.year ||
        chosen.month != saved.month ||
        chosen.day != saved.day ||
        formState.unknownTime != widget.birthChart.unknownTime ||
        (!formState.unknownTime &&
            formState.selectedTime != TimeOfDay.fromDateTime(saved));
  }

  Future<void> _updateBirthChart() async {
    if (!_hasChanges) {
      Navigator.of(context).pop();
      return;
    }

    // Validate form with visual feedback
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final formState = _formStateKey.currentState;
    if (formState == null) return;

    final t = Translations.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      // Prepare update data
      final updateData = <String, dynamic>{
        'given_name': formState.givenName,
        'family_name': formState.familyName,
        'gender': formState.gender,
        'time_fold': formState.birthTime.fold,
      };

      // Add date/time if changed
      if (_birthTimeChanged(formState)) {
        updateData['date'] = formState.birthDateTime;
        updateData['unknown_time'] = formState.unknownTime;
      }

      // Add place if changed and new place selected
      if (formState.selectedLocation != null) {
        updateData['place_id'] = formState.selectedLocation!.placeId;
        updateData['place'] = formState.selectedLocation!.formattedAddress;
      }

      await _birthChartService.updateBirthChart(
        widget.birthChart.id,
        updateData,
      );
      ReadingStateService().clearReadingState(widget.birthChart.id);

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, t.ui.birthChartUpdated);
        widget.onUpdated?.call();
      }
    } catch (e) {
      if (!mounted) return;
      final handledInForm =
          e is ApiException &&
          formState.birthTime.handle(e.errorKey, e.message);
      if (!handledInForm) {
        SnackbarUtils.showError(
          context,
          e is ApiException ? e.message : e.toString(),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return GenericDialog(
      title: t.ui.editBirthChart,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(t.ui.cancel),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _isLoading ? null : _updateBirthChart,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.ui.save),
        ),
      ],
      child: Form(key: _formKey, child: _formWidget),
    );
  }
}
