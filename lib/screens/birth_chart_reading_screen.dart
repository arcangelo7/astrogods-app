// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../mixins/subscription_loader_mixin.dart';
import '../models/birth_chart.dart';
import '../providers/theme_provider.dart';
import '../services/birth_chart_service.dart';
import '../services/reading_state_service.dart';
import '../services/api_client.dart';
import '../utils/snackbar_utils.dart';
import '../utils/session_utils.dart';
import '../widgets/birth_chart_header.dart';
import '../widgets/reading_screen_layout.dart';
import '../widgets/reading_content.dart';
import '../widgets/reading_language_banner.dart';
import '../widgets/pdf_download_widget.dart';
import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';

class BirthChartReadingScreen extends StatefulWidget {
  final BirthChart birthChart;
  final bool chartOnly;

  const BirthChartReadingScreen({
    super.key,
    required this.birthChart,
    this.chartOnly = false,
  });

  @override
  State<BirthChartReadingScreen> createState() =>
      _BirthChartReadingScreenState();
}

class _BirthChartReadingScreenState extends State<BirthChartReadingScreen>
    with SubscriptionLoaderMixin {
  late final BirthChartService _service;
  late final ReadingStateService _readingStateService;
  bool _wasGenerating = false;

  @override
  void initState() {
    super.initState();
    _service = BirthChartService(context: context);
    _readingStateService = ReadingStateService();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.chartOnly) return;

      loadSubscriptionStatus();

      // If state says generating but SSE subscription is dead, reset and restart
      // Check BEFORE _loadExistingReading to avoid HTTP interference
      if (mounted &&
          _readingStateService.isGenerating(widget.birthChart.id) &&
          !_readingStateService.hasActiveSubscription(widget.birthChart.id)) {
        _readingStateService.clearReadingState(widget.birthChart.id);
        _generateReading();
        return;
      }

      await _loadExistingReading();

      // Check if subscription is required and redirect immediately
      if (mounted &&
          _readingStateService.isSubscriptionRequired(widget.birthChart.id)) {
        final error = _readingStateService.getError(widget.birthChart.id);
        SnackbarUtils.showInfo(context, error!);
        context.push('/subscription-plans');
        return;
      }

      // Start generation if not already exists and not generating
      if (mounted &&
          _readingStateService.getReading(widget.birthChart.id) == null &&
          !_readingStateService.isGenerating(widget.birthChart.id) &&
          !_readingStateService.hasError(widget.birthChart.id)) {
        _generateReading();
      }
    });

    // Listen to reading state changes
    _readingStateService.addListener(_onReadingStateChanged);
  }

  @override
  void dispose() {
    _readingStateService.removeListener(_onReadingStateChanged);
    super.dispose();
  }

  void _onReadingStateChanged() async {
    if (mounted) {
      final chartId = widget.birthChart.id;
      final isCurrentlyGenerating = _readingStateService.isGenerating(chartId);

      // Check for subscription errors first - always redirect automatically
      if (_readingStateService.hasError(chartId) &&
          _readingStateService.isSubscriptionRequired(chartId)) {
        final error = _readingStateService.getError(chartId);
        if (!mounted) return;
        SnackbarUtils.showInfo(context, error!);
        context.go('/subscription-plans');
        return;
      }

      // Check for other errors only if was generating
      if (_readingStateService.hasError(chartId) && _wasGenerating) {
        final error = _readingStateService.getError(chartId);
        final errorKey = _readingStateService.getErrorKey(widget.birthChart.id);
        if (!SessionUtils.handleSessionExpirationByKey(
          context,
          errorKey,
          error!,
        )) {
          SnackbarUtils.showCopyableErrorSnackBar(context, error);
        }
        _wasGenerating = false;
        onRegenerationError();
        return;
      }

      // Check if we just completed generation (was generating, now not generating and has reading)
      if (_wasGenerating &&
          !isCurrentlyGenerating &&
          _readingStateService.getReading(chartId) != null &&
          !_readingStateService.hasError(chartId)) {
        SnackbarUtils.showSuccess(
          context,
          AppLocalizations.of(context)!.readingGeneratedSuccessfully,
        );
        onRegenerationComplete();
      }

      _wasGenerating = isCurrentlyGenerating;
      setState(() {});
    }
  }

  Future<void> _loadExistingReading() async {
    try {
      final reading = await _service.getReading(widget.birthChart.id);
      if (reading != null) {
        _readingStateService.setExistingReading(widget.birthChart.id, reading);
      }
    } catch (e) {
      // Reading doesn't exist or error loading - that's okay
    }
  }

  void _handleRegenerate() {
    startRegeneration(
      () => _readingStateService.clearReadingState(widget.birthChart.id),
      _generateReading,
    );
  }

  Future<void> _generateReading() async {
    if (_readingStateService.isGenerating(widget.birthChart.id) || !mounted) {
      return;
    }

    try {
      final readingStream = _service.streamReading(widget.birthChart.id);
      _wasGenerating = true; // Set flag before starting generation
      _readingStateService.startGeneration(widget.birthChart.id, readingStream);
    } catch (e) {
      if (mounted) {
        SessionUtils.handleApiException(
          context,
          e as ApiException,
          (message) =>
              SnackbarUtils.showCopyableErrorSnackBar(context, message),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select<ThemeProvider, bool>((p) => p.isDarkMode);

    return ReadingScreenLayout(
      darkMode: isDarkMode,
      personAName: widget.birthChart.fullName,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(
            context,
          )!.birthChartOf(widget.birthChart.fullName),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      header: BirthChartHeader(birthChart: widget.birthChart),
      birthChartId: widget.birthChart.id,
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (widget.chartOnly) {
      return _buildChartOnlyContent();
    }

    final chartId = widget.birthChart.id;
    final isGenerating = _readingStateService.isGenerating(chartId);
    final hasError = _readingStateService.hasError(chartId);
    final reading = _readingStateService.getReading(chartId);
    final generatedContent = _readingStateService.getGeneratedContent(chartId);
    final currentTopic = _readingStateService.getCurrentTopic(chartId);
    final error = _readingStateService.getError(chartId);

    final showBanner = reading != null &&
        reading.language != null &&
        !isGenerating &&
        !hasError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBanner)
          ReadingLanguageBanner(
            readingLanguage: reading.language!,
            hasSubscription: subscriptionStatus?.hasActiveSubscription ?? false,
            hasPremiumSubscription: subscriptionStatus?.hasPremiumSubscription ?? false,
            requiresPremium: false,
            isLoadingSubscription: subscriptionStatus == null,
            onRegenerate: _handleRegenerate,
            isRegenerating: isRegenerating,
          ),
        ReadingContent(
          reading: reading?.reading,
          generatedContent: generatedContent,
          isGenerating: isGenerating,
          hasError: hasError,
          currentTopic: currentTopic,
          error: error,
          emptyStateWidget: _buildEmptyState(),
          errorStateBuilder: (error) => _buildErrorState(error),
          birthChart: widget.birthChart,
          readingModel: reading,
          isSubscriptionRequired: _readingStateService.isSubscriptionRequired(chartId),
        ),
      ],
    );
  }

  Widget _buildChartOnlyContent() {
    return Center(
      child: PdfDownloadWidget(
        type: PdfDownloadType.birthChart,
        birthChart: widget.birthChart,
        chartOnly: true,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 12),
          Text(AppLocalizations.of(context)!.preparingReading),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.errorTitle,
              style: AppTextStyles.getH5Style(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              error,
              style: AppTextStyles.getBodyStyle(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _readingStateService.clearReadingState(widget.birthChart.id);
                _generateReading();
              },
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      ),
    );
  }
}
