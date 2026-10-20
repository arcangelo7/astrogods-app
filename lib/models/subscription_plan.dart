import 'package:in_app_purchase/in_app_purchase.dart';

import '../services/apple_store_service.dart';
import '../services/stripe_service.dart';
import 'subscription.dart';

enum PlanType { monthly, semiannual, annual }

enum PlanTier { standard, premium }

enum CardStyle { normal, alternative, main }

enum PlanBadge { currentPlan, upgrade, downgrade, none }

class SubscriptionPlan {
  final String title;
  final String price;
  final String period;
  final String billingInfo;
  final String? originalPrice;
  final String? discountedPrice;
  final String? discount;
  final String? extraInfo;
  final String? saveAmount;
  final String? annualTotal;
  final List<String> features;
  final List<String>? excludedFeatures;
  final PlanTier tier;
  final PlanType type;
  final CardStyle cardStyle;
  final String priceId;
  final PlanBadge badge;
  final bool isCurrentPlan;
  final DateTime? nextRenewalDate;
  final bool cancelAtPeriodEnd;

  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.period,
    required this.billingInfo,
    this.originalPrice,
    this.discountedPrice,
    this.discount,
    this.extraInfo,
    this.saveAmount,
    this.annualTotal,
    required this.features,
    this.excludedFeatures,
    required this.tier,
    required this.type,
    this.cardStyle = CardStyle.normal,
    required this.priceId,
    this.badge = PlanBadge.none,
    this.isCurrentPlan = false,
    this.nextRenewalDate,
    this.cancelAtPeriodEnd = false,
  });

  bool get isPremium => tier == PlanTier.premium;

  SubscriptionPlan copyWith({
    String? title,
    String? price,
    String? period,
    String? billingInfo,
    String? originalPrice,
    String? discountedPrice,
    String? discount,
    String? extraInfo,
    String? saveAmount,
    String? annualTotal,
    List<String>? features,
    List<String>? excludedFeatures,
    PlanTier? tier,
    PlanType? type,
    CardStyle? cardStyle,
    String? priceId,
    PlanBadge? badge,
    bool? isCurrentPlan,
    DateTime? nextRenewalDate,
    bool? cancelAtPeriodEnd,
  }) {
    return SubscriptionPlan(
      title: title ?? this.title,
      price: price ?? this.price,
      period: period ?? this.period,
      billingInfo: billingInfo ?? this.billingInfo,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      discount: discount ?? this.discount,
      extraInfo: extraInfo ?? this.extraInfo,
      saveAmount: saveAmount ?? this.saveAmount,
      annualTotal: annualTotal ?? this.annualTotal,
      features: features ?? this.features,
      excludedFeatures: excludedFeatures ?? this.excludedFeatures,
      tier: tier ?? this.tier,
      type: type ?? this.type,
      cardStyle: cardStyle ?? this.cardStyle,
      priceId: priceId ?? this.priceId,
      badge: badge ?? this.badge,
      isCurrentPlan: isCurrentPlan ?? this.isCurrentPlan,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
      cancelAtPeriodEnd: cancelAtPeriodEnd ?? this.cancelAtPeriodEnd,
    );
  }

  static List<SubscriptionPlan> annotateWithCurrentPlan(
    List<SubscriptionPlan> plans,
    Subscription? currentSubscription,
  ) {
    if (currentSubscription == null) {
      return plans;
    }

    final isActiveSubscription =
        currentSubscription.status == 'active' ||
        currentSubscription.status == 'trialing';
    if (!isActiveSubscription) {
      return plans;
    }

    final currentTier = PlanTier.values.byName(currentSubscription.tier);
    final currentType = PlanType.values.byName(currentSubscription.period);
    final currentPlan = plans.firstWhere(
      (plan) => plan.tier == currentTier && plan.type == currentType,
    );

    return plans.map((plan) {
      if (plan.tier == currentTier && plan.type == currentType) {
        return plan.copyWith(
          badge: PlanBadge.currentPlan,
          isCurrentPlan: true,
          nextRenewalDate: currentSubscription.currentPeriodEndDate,
          cancelAtPeriodEnd: currentSubscription.cancelAtPeriodEnd,
        );
      }

      final badge = _determinePlanBadge(plan, currentPlan);
      return plan.copyWith(badge: badge);
    }).toList();
  }

  static PlanBadge _determinePlanBadge(
    SubscriptionPlan targetPlan,
    SubscriptionPlan currentPlan,
  ) {
    final tierComparison = _compareTiers(targetPlan.tier, currentPlan.tier);

    if (tierComparison > 0) {
      return PlanBadge.upgrade;
    } else if (tierComparison < 0) {
      return PlanBadge.downgrade;
    }

    return PlanBadge.none;
  }

  static int _compareTiers(PlanTier tier1, PlanTier tier2) {
    const tierOrder = {PlanTier.standard: 0, PlanTier.premium: 1};
    return (tierOrder[tier1] ?? 0) - (tierOrder[tier2] ?? 0);
  }

  static int _compareDurations(PlanType type1, PlanType type2) {
    const durationOrder = {
      PlanType.monthly: 0,
      PlanType.semiannual: 1,
      PlanType.annual: 2,
    };
    return (durationOrder[type1] ?? 0) - (durationOrder[type2] ?? 0);
  }

  static List<SubscriptionPlan> sortByPriority(List<SubscriptionPlan> plans) {
    final sortedPlans = List<SubscriptionPlan>.from(plans);

    sortedPlans.sort((a, b) {
      if (a.isCurrentPlan && !b.isCurrentPlan) return -1;
      if (!a.isCurrentPlan && b.isCurrentPlan) return 1;

      if (a.badge == PlanBadge.upgrade && b.badge != PlanBadge.upgrade) {
        return -1;
      }
      if (a.badge != PlanBadge.upgrade && b.badge == PlanBadge.upgrade) {
        return 1;
      }

      if (a.badge == PlanBadge.downgrade && b.badge != PlanBadge.downgrade) {
        return 1;
      }
      if (a.badge != PlanBadge.downgrade && b.badge == PlanBadge.downgrade) {
        return -1;
      }

      final tierComp = _compareTiers(b.tier, a.tier);
      if (tierComp != 0) return tierComp;

      return _compareDurations(b.type, a.type);
    });

    return sortedPlans;
  }

  static List<String> getPremiumFeatures(dynamic t) {
    return [
      t.ui.birthChartReadings,
      t.ui.couplesChartReadings,
      t.ui.dailyMonthlyTransits,
      t.ui.horoscopeNewsletter,
    ];
  }

  static List<String> getStandardFeatures(dynamic t) {
    return [t.ui.birthChartReadings];
  }

  static List<String> getStandardExcludedFeatures(dynamic t) {
    return [
      t.ui.couplesChartReadings,
      t.ui.dailyMonthlyTransits,
      t.ui.horoscopeNewsletter,
    ];
  }

  static List<SubscriptionPlan> getMonthlyPlans(
    dynamic t,
    StripeConfig stripeConfig,
  ) {
    return [
      SubscriptionPlan(
        title: t.ui.premiumMonthly,
        price: '4,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedMonthly,
        features: getPremiumFeatures(t),
        tier: PlanTier.premium,
        type: PlanType.monthly,
        priceId: stripeConfig.premiumMonthly,
      ),
      SubscriptionPlan(
        title: t.ui.standardMonthly,
        price: '2,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedMonthly,
        features: getStandardFeatures(t),
        excludedFeatures: getStandardExcludedFeatures(t),
        tier: PlanTier.standard,
        type: PlanType.monthly,
        priceId: stripeConfig.standardMonthly,
      ),
    ];
  }

  static List<SubscriptionPlan> getSemiannualPlans(
    dynamic t,
    StripeConfig stripeConfig,
  ) {
    return [
      SubscriptionPlan(
        title: t.ui.premiumSemiannual,
        price: '3,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedSemiannually,
        originalPrice: '29,94 €',
        discountedPrice: '23,94 €',
        discount: t.ui.save20Percent,
        extraInfo: t.ui.oneMonthFree,
        features: getPremiumFeatures(t),
        tier: PlanTier.premium,
        type: PlanType.semiannual,
        priceId: stripeConfig.premiumSemestral,
      ),
      SubscriptionPlan(
        title: t.ui.standardSemiannual,
        price: '2,39 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedSemiannually,
        originalPrice: '17,94 €',
        discountedPrice: '14,35 €',
        discount: t.ui.save20Percent,
        extraInfo: t.ui.oneMonthFree,
        features: getStandardFeatures(t),
        excludedFeatures: getStandardExcludedFeatures(t),
        tier: PlanTier.standard,
        type: PlanType.semiannual,
        priceId: stripeConfig.standardSemestral,
      ),
    ];
  }

  static List<SubscriptionPlan> getAnnualPlans(
    dynamic t,
    StripeConfig stripeConfig,
  ) {
    return [
      SubscriptionPlan(
        title: t.ui.premiumAnnual,
        price: '2,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedAnnually,
        originalPrice: '59,88 €',
        discountedPrice: '35,88 €',
        discount: t.ui.save40Percent,
        extraInfo: t.ui.fourMonthsFree,
        features: getPremiumFeatures(t),
        tier: PlanTier.premium,
        type: PlanType.annual,
        priceId: stripeConfig.premiumAnnual,
      ),
      SubscriptionPlan(
        title: t.ui.standardAnnual,
        price: '1,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedAnnually,
        originalPrice: '35,88 €',
        discountedPrice: '23,88 €',
        discount: t.ui.save33Percent,
        extraInfo: t.ui.fourMonthsFree,
        features: getStandardFeatures(t),
        excludedFeatures: getStandardExcludedFeatures(t),
        tier: PlanTier.standard,
        type: PlanType.annual,
        priceId: stripeConfig.standardAnnual,
      ),
    ];
  }

  static List<SubscriptionPlan> getApplePlans(
    dynamic t,
    List<ProductDetails> products,
  ) {
    return products.map((product) {
      final (tier, type) = AppleStoreService.products[product.id]!;
      final isPremium = tier == PlanTier.premium;
      return SubscriptionPlan(
        title: switch (type) {
          PlanType.monthly =>
            isPremium ? t.ui.premiumMonthly : t.ui.standardMonthly,
          PlanType.semiannual =>
            isPremium ? t.ui.premiumSemiannual : t.ui.standardSemiannual,
          PlanType.annual =>
            isPremium ? t.ui.premiumAnnual : t.ui.standardAnnual,
        },
        price: product.price,
        period: switch (type) {
          PlanType.monthly => t.ui.monthPeriod,
          PlanType.semiannual => t.ui.sixMonthsPeriod,
          PlanType.annual => t.ui.yearPeriod,
        },
        billingInfo: switch (type) {
          PlanType.monthly => t.ui.billedMonthly,
          PlanType.semiannual => t.ui.billedSemiannually,
          PlanType.annual => t.ui.billedAnnually,
        },
        features: isPremium ? getPremiumFeatures(t) : getStandardFeatures(t),
        excludedFeatures: isPremium ? null : getStandardExcludedFeatures(t),
        tier: tier,
        type: type,
        priceId: product.id,
      );
    }).toList();
  }

  static List<SubscriptionPlan> getSimplifiedPlans(
    dynamic t,
    StripeConfig stripeConfig,
  ) {
    return [
      SubscriptionPlan(
        title: t.ui.premiumAnnual,
        price: '2,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedAnnually,
        originalPrice: '4,99 €',
        saveAmount: '24 €',
        annualTotal: '35,88 €',
        features: getPremiumFeatures(t),
        tier: PlanTier.premium,
        type: PlanType.annual,
        cardStyle: CardStyle.main,
        priceId: stripeConfig.premiumAnnual,
      ),
      SubscriptionPlan(
        title: t.ui.premiumMonthly,
        price: '4,99 €',
        period: t.ui.monthPeriod,
        billingInfo: t.ui.billedMonthly,
        features: getPremiumFeatures(t),
        tier: PlanTier.premium,
        type: PlanType.monthly,
        cardStyle: CardStyle.alternative,
        priceId: stripeConfig.premiumMonthly,
      ),
    ];
  }
}
