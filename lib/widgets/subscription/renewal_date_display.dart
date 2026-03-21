// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter/material.dart';
import '../../constants/text_styles.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/date_utils.dart' as date_utils;

class RenewalDateDisplay extends StatelessWidget {
  final DateTime renewalDate;
  final bool cancelAtPeriodEnd;

  const RenewalDateDisplay({
    super.key,
    required this.renewalDate,
    this.cancelAtPeriodEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final formattedDate = date_utils.DateUtils.formatDate(context, renewalDate);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            cancelAtPeriodEnd ? Icons.event_busy : Icons.calendar_today,
            color: cancelAtPeriodEnd ? colorScheme.error : colorScheme.primary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              cancelAtPeriodEnd
                  ? '${localizations.subscriptionCancelsOn}: $formattedDate'
                  : '${localizations.nextRenewal}: $formattedDate',
              style: AppTextStyles.getCaptionStyle(context).copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
