import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../i18n/translations.g.dart';
import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_form_widget.dart';
import '../widgets/generic_dialog.dart';
import '../providers/auth_provider.dart';

class CreateBirthChartDialog extends StatefulWidget {
  final Function(BirthChart)? onCreated;

  const CreateBirthChartDialog({super.key, this.onCreated});

  @override
  State<CreateBirthChartDialog> createState() => _CreateBirthChartDialogState();
}

class _CreateBirthChartDialogState extends State<CreateBirthChartDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<BirthChartFormWidgetState> _formStateKey =
      GlobalKey<BirthChartFormWidgetState>();
  late BirthChartFormWidget _formWidget;
  late BirthChartService _birthChartService;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService();
    _formWidget = BirthChartFormWidget(key: _formStateKey, isEditMode: false);
  }

  @override
  void dispose() {
    _birthChartService.dispose();
    super.dispose();
  }

  Future<void> _createBirthChart() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (!authProvider.isAuthenticated) {
      _showAuthenticationRequired();
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    final formState = _formStateKey.currentState;
    if (formState == null) return;

    final t = Translations.of(context);

    setState(() {
      _isLoading = true;
    });

    try {
      final birthChart = await _birthChartService.createBirthChart(
        givenName: formState.givenName,
        familyName: formState.familyName,
        gender: formState.gender,
        date: formState.birthDateTime,
        placeId: formState.selectedLocation!.placeId,
        place: formState.selectedLocation!.formattedAddress,
        unknownTime: formState.unknownTime,
        timeFold: formState.birthTime.fold,
      );

      await _birthChartService.calculateBirthChart(birthChart.id);

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(context, t.ui.birthChartCreated);
        widget.onCreated?.call(birthChart);
      }
    } catch (e) {
      if (!mounted) return;
      final handledInForm =
          e is ApiException &&
          formState.birthTime.handle(e.errorKey, e.message);
      if (!handledInForm) {
        if (e is ApiException && e.isSubscriptionError) {
          SnackbarUtils.showInfo(context, e.message);
        } else {
          final errorMessage = e is ApiException && e.message.isNotEmpty
              ? e.message
              : t.ui.errorCreatingBirthChart(error: e.toString());
          SnackbarUtils.showCopyableErrorSnackBar(context, errorMessage);
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showAuthenticationRequired() {
    final t = Translations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.ui.authenticationRequired),
        content: Text(t.ui.pleaseLoginToSaveCharts),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.ui.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close auth dialog
              Navigator.of(context).pop(); // Close create dialog
              context.go('/login'); // Navigate to login
            },
            child: Text(t.ui.login),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return GenericDialog(
      title: t.ui.createBirthChart,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(t.ui.cancel),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _isLoading ? null : _createBirthChart,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.ui.create),
        ),
      ],
      child: Form(key: _formKey, child: _formWidget),
    );
  }
}
