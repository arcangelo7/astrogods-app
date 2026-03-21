// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/text_styles.dart';
import '../l10n/app_localizations.dart';
import '../widgets/starry_night_background.dart';

class SubscriptionSuccessScreen extends StatelessWidget {
  final bool isPremium;

  const SubscriptionSuccessScreen({
    super.key,
    this.isPremium = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: StarryNightBackground(
        showPlanet: true,
        subtle: true,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Icon(
                  Icons.check_circle,
                  size: 80,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.subscriptionSuccessTitle,
                  style: AppTextStyles.getH2Style(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  isPremium
                      ? l10n.subscriptionSuccessMessagePremium
                      : l10n.subscriptionSuccessMessageStandard,
                  style: AppTextStyles.getBodyStyle(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    l10n.subscriptionSuccessTrialInfo,
                    style: AppTextStyles.getCaptionStyle(context).copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                _buildCtaCard(
                  context,
                  icon: Icons.person,
                  title: l10n.personalityTitle,
                  description: l10n.unveilHeart,
                  onTap: () => context.go('/personality'),
                ),
                if (isPremium) ...[
                  const SizedBox(height: 16),
                  _buildCtaCard(
                    context,
                    icon: Icons.favorite,
                    title: l10n.relationshipsTitle,
                    description: l10n.discoverHeartOfRelationship,
                    onTap: () => context.go('/relationships'),
                  ),
                  const SizedBox(height: 16),
                  _buildCtaCard(
                    context,
                    icon: Icons.schedule,
                    title: l10n.predictionsTitle,
                    description: l10n.anticipateYourDayWithTransits,
                    onTap: () => context.go('/predictions'),
                  ),
                ],
                const SizedBox(height: 40),
                FilledButton(
                  onPressed: () => context.go('/'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(l10n.subscriptionSuccessGoHome),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCtaCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      color: colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.getH6Style(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.getCaptionStyle(context).copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
