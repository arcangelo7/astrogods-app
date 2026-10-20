import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../models/birth_chart.dart';
import '../services/birth_chart_service.dart';
import '../widgets/starry_night_background.dart';
import '../i18n/translations.g.dart';
import 'birth_chart_reading_screen.dart';
import '../utils/error_utils.dart';

class BirthChartReadingWrapper extends StatefulWidget {
  final int birthChartId;
  final bool chartOnly;

  const BirthChartReadingWrapper({
    super.key,
    required this.birthChartId,
    this.chartOnly = false,
  });

  @override
  State<BirthChartReadingWrapper> createState() =>
      _BirthChartReadingWrapperState();
}

class _BirthChartReadingWrapperState extends State<BirthChartReadingWrapper> {
  late final BirthChartService _service;
  BirthChart? _birthChart;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _service = BirthChartService();
    _loadBirthChart();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }

  Future<void> _loadBirthChart() async {
    try {
      final birthChart = await _service.getBirthChart(widget.birthChartId);
      if (mounted) {
        setState(() {
          _birthChart = birthChart;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = userErrorMessage(context, e);
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    if (_isLoading) {
      return Scaffold(
        body: StarryNightBackground(
          showPlanet: false,
          subtle: true,
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (_error != null || _birthChart == null) {
      return Scaffold(
        body: StarryNightBackground(
          showPlanet: false,
          subtle: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  _error ?? t.ui.birthChartNotFound,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: Text(t.ui.goToHome),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BirthChartReadingScreen(
      birthChart: _birthChart!,
      chartOnly: widget.chartOnly,
    );
  }
}
