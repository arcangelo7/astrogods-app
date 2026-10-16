import 'dart:typed_data';

import 'package:material_ui/material_ui.dart';

import '../models/birth_chart.dart';
import '../models/synastry.dart';
import '../models/transit.dart';
import '../models/reading.dart';
import '../services/pdf_service.dart';
import '../utils/snackbar_utils.dart';
import '../i18n/translations.g.dart';

enum PdfDownloadType { birthChart, synastry, dailyTransit, monthlyTransit }

class PdfDownloadWidget extends StatefulWidget {
  final PdfDownloadType type;
  final BirthChart? birthChart;
  final Synastry? synastry;
  final Reading? reading;
  final DailyTransitReading? dailyTransit;
  final MonthlyTransitReading? monthlyTransit;
  final bool chartOnly;

  const PdfDownloadWidget({
    super.key,
    required this.type,
    this.birthChart,
    this.synastry,
    this.reading,
    this.dailyTransit,
    this.monthlyTransit,
    this.chartOnly = false,
  });

  @override
  State<PdfDownloadWidget> createState() => _PdfDownloadWidgetState();
}

class _PdfDownloadWidgetState extends State<PdfDownloadWidget> {
  bool _isGenerating = false;
  late final PdfService _pdfService;

  @override
  void initState() {
    super.initState();
    _pdfService = PdfService(context: context);
  }

  bool get _canDownload {
    if (widget.type == PdfDownloadType.birthChart) {
      return widget.birthChart != null &&
          (widget.reading != null || widget.chartOnly);
    } else if (widget.type == PdfDownloadType.synastry) {
      return widget.synastry != null &&
          (widget.reading != null || widget.chartOnly);
    } else if (widget.type == PdfDownloadType.dailyTransit) {
      return widget.dailyTransit != null && widget.birthChart != null;
    } else if (widget.type == PdfDownloadType.monthlyTransit) {
      return widget.monthlyTransit != null && widget.birthChart != null;
    }
    return false;
  }

  String _generateFilename() {
    final t = Translations.of(context);

    if (widget.type == PdfDownloadType.birthChart &&
        widget.birthChart != null) {
      final name = widget.birthChart!.fullName;
      final prefix = widget.chartOnly
          ? t.ui.birthChartGraph
          : t.ui.birthChartReading;
      return '$prefix - $name.pdf';
    } else if (widget.type == PdfDownloadType.synastry &&
        widget.synastry != null) {
      final nameA = widget.synastry!.birthChartA!.givenName;
      final nameB = widget.synastry!.birthChartB!.givenName;
      final prefix = widget.chartOnly ? t.ui.synastryGraph : t.ui.synastry;
      return '$prefix - $nameA & $nameB.pdf';
    } else if (widget.type == PdfDownloadType.dailyTransit &&
        widget.dailyTransit != null &&
        widget.birthChart != null) {
      final name = widget.birthChart!.fullName;
      final date = widget.dailyTransit!.date;
      final dateStr = '${date.day}-${date.month}-${date.year}';
      final prefix = widget.chartOnly
          ? t.ui.dailyTransitGraph
          : t.ui.dailyPredictions;
      return '$prefix - $name - $dateStr.pdf';
    } else if (widget.type == PdfDownloadType.monthlyTransit &&
        widget.monthlyTransit != null &&
        widget.birthChart != null) {
      final name = widget.birthChart!.fullName;
      final dateStr =
          '${widget.monthlyTransit!.month}-${widget.monthlyTransit!.year}';
      final prefix = widget.chartOnly
          ? t.ui.monthlyTransitGraph
          : t.ui.monthlyPredictions;
      return '$prefix - $name - $dateStr.pdf';
    }
    return '${t.ui.appTitle} - Reading.pdf';
  }

  Future<void> _downloadPdf() async {
    if (!_canDownload || _isGenerating) return;

    setState(() {
      _isGenerating = true;
    });

    try {
      late final Uint8List pdfBytes;

      switch (widget.type) {
        case PdfDownloadType.birthChart:
          if (widget.chartOnly) {
            pdfBytes = await _pdfService.generateBirthChartChartOnlyPdf(
              birthChart: widget.birthChart!,
            );
          } else {
            pdfBytes = await _pdfService.generateBirthChartPdf(
              birthChart: widget.birthChart!,
              reading: widget.reading!,
            );
          }
        case PdfDownloadType.synastry:
          if (widget.chartOnly) {
            pdfBytes = await _pdfService.generateSynastryChartOnlyPdf(
              synastry: widget.synastry!,
            );
          } else {
            pdfBytes = await _pdfService.generateSynastryPdf(
              synastry: widget.synastry!,
              reading: widget.reading!,
            );
          }
        case PdfDownloadType.dailyTransit:
          if (widget.chartOnly) {
            pdfBytes = await _pdfService.generateDailyTransitChartOnlyPdf(
              birthChart: widget.birthChart!,
              transit: widget.dailyTransit!,
            );
          } else {
            pdfBytes = await _pdfService.generateDailyTransitPdf(
              birthChart: widget.birthChart!,
              transit: widget.dailyTransit!,
            );
          }
        case PdfDownloadType.monthlyTransit:
          if (widget.chartOnly) {
            pdfBytes = await _pdfService.generateMonthlyTransitChartOnlyPdf(
              birthChart: widget.birthChart!,
              transit: widget.monthlyTransit!,
            );
          } else {
            pdfBytes = await _pdfService.generateMonthlyTransitPdf(
              birthChart: widget.birthChart!,
              transit: widget.monthlyTransit!,
            );
          }
      }

      final filename = _generateFilename();
      final saved = await _pdfService.sharePdf(pdfBytes, filename);

      if (mounted && saved) {
        SnackbarUtils.showSuccess(
          context,
          Translations.of(context).ui.pdfDownloadedSuccessfully,
        );
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          Translations.of(context).ui.pdfGenerationError(error: e.toString()),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_canDownload) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton.icon(
        onPressed: _isGenerating ? null : _downloadPdf,
        icon: _isGenerating
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.picture_as_pdf),
        label: Text(
          _isGenerating
              ? Translations.of(context).ui.generatingPdf
              : Translations.of(context).ui.downloadPdf,
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          disabledBackgroundColor: Theme.of(context)
              .colorScheme
              .surfaceContainerHighest,
          disabledForegroundColor: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
