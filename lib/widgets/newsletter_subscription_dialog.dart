import 'package:material_ui/material_ui.dart';

import '../i18n/translations.g.dart';
import '../constants/text_styles.dart';
import '../models/birth_chart.dart';
import '../services/newsletter_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/birth_chart_selector.dart';
import '../widgets/location_search_field.dart';
import '../models/location.dart';

class NewsletterSubscriptionDialog extends StatefulWidget {
  const NewsletterSubscriptionDialog({super.key});

  @override
  State<NewsletterSubscriptionDialog> createState() =>
      _NewsletterSubscriptionDialogState();
}

class _NewsletterSubscriptionDialogState
    extends State<NewsletterSubscriptionDialog> {
  BirthChart? _selectedChart;
  PlaceDetails? _selectedLocation;
  String _selectedType = 'daily'; // 'daily' or 'monthly'
  bool _isLoading = false;
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return AlertDialog(
      title: Text(
        _selectedType == 'daily'
            ? t.ui.subscribeToDaily
            : t.ui.subscribeToMonthly,
        style: AppTextStyles.getH3Style(context),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Newsletter type selection
            DropdownMenuFormField<String>(
              expandedInsets: EdgeInsets.zero,
              initialSelection: _selectedType,
              label: Text(t.ui.newsletterType),
              textStyle: AppTextStyles.getBodyStyle(context),
              onSelected: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
              menuStyle: MenuStyle(
                elevation: WidgetStatePropertyAll(8),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.surface,
                ),
                shadowColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
                ),
              ),
              decorationBuilder: (context, controller) {
                return InputDecoration(
                  labelStyle: AppTextStyles.getFormLabelStyle(context),
                  floatingLabelStyle: AppTextStyles.getFloatingLabelStyle(
                    context,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline
                          .withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  filled: true,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.3),
                );
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'daily', label: t.ui.subscribeToDaily),
                DropdownMenuEntry(
                  value: 'monthly',
                  label: t.ui.subscribeToMonthly,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Birth chart selection
            BirthChartSelector(
              selectedChart: _selectedChart,
              validator: (chart) {
                if (chart == null) {
                  return Translations.of(context).ui.pleaseSelectBirthChart;
                }
                return null;
              },
              onChanged: (chart) {
                setState(() {
                  _selectedChart = chart;
                });
              },
              allowNull: false,
              autoSelectPersonal: true,
            ),
            const SizedBox(height: 16),

            // Location selection
            LocationSearchField(
              controller: _locationController,
              labelText: t.ui.currentLocation,
              onLocationSelected: (PlaceDetails? location) {
                setState(() {
                  _selectedLocation = location;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(t.ui.cancel),
        ),
        ElevatedButton(
          onPressed:
              _isLoading || _selectedChart == null || _selectedLocation == null
              ? null
              : _subscribe,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  _selectedType == 'daily'
                      ? t.ui.subscribeToDaily
                      : t.ui.subscribeToMonthly,
                ),
        ),
      ],
    );
  }

  Future<void> _subscribe() async {
    if (_selectedChart == null || _selectedLocation == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newsletterService = NewsletterService(context: context);

      if (_selectedType == 'daily') {
        await newsletterService.subscribeDailyNewsletter(
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      } else {
        await newsletterService.subscribeMonthlyNewsletter(
          birthChartId: _selectedChart!.id,
          placeId: _selectedLocation!.placeId,
          place: _selectedLocation!.formattedAddress,
        );
      }

      if (mounted) {
        Navigator.of(context).pop();
        SnackbarUtils.showSuccess(
          context,
          Translations.of(context).ui.subscribeSuccess,
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        SnackbarUtils.showError(context, e.toString());
      }
    }
  }
}
