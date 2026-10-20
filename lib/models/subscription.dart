import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  final String id;
  final String source;
  final String status;
  @JsonKey(name: 'current_period_start')
  final int? currentPeriodStart;
  @JsonKey(name: 'current_period_end')
  final int? currentPeriodEnd;
  @JsonKey(name: 'cancel_at_period_end')
  final bool cancelAtPeriodEnd;
  final String tier;
  final String period;
  final int? amount;
  final String? currency;

  /// Where a Stripe subscription was bought; null for Apple subscriptions and
  /// for Stripe subscriptions created before the app reported it.
  final String? platform;

  Subscription({
    required this.id,
    required this.source,
    required this.status,
    this.currentPeriodStart,
    this.currentPeriodEnd,
    required this.cancelAtPeriodEnd,
    required this.tier,
    required this.period,
    this.amount,
    this.currency,
    this.platform,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  bool get isApple => source == 'apple';

  bool get isPremium => tier == 'premium';

  DateTime? get currentPeriodStartDate => currentPeriodStart != null
      ? DateTime.fromMillisecondsSinceEpoch(currentPeriodStart! * 1000)
      : null;

  DateTime? get currentPeriodEndDate => currentPeriodEnd != null
      ? DateTime.fromMillisecondsSinceEpoch(currentPeriodEnd! * 1000)
      : null;

  bool get isFailedPayment {
    return status == 'past_due' ||
        status == 'unpaid' ||
        status == 'incomplete' ||
        status == 'incomplete_expired';
  }
}

@JsonSerializable()
class SubscriptionStatusResponse {
  final Subscription? subscription;
  @JsonKey(name: 'has_active_subscription')
  final bool hasActiveSubscription;
  @JsonKey(name: 'has_trial_eligibility')
  final bool hasTrialEligibility;

  SubscriptionStatusResponse({
    this.subscription,
    required this.hasActiveSubscription,
    this.hasTrialEligibility = true,
  });

  factory SubscriptionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionStatusResponseToJson(this);

  bool get hasSubscription => subscription != null;

  bool get isActive =>
      subscription?.status == 'active' || subscription?.status == 'trialing';

  bool get isFailedPayment => subscription?.isFailedPayment ?? false;

  bool get isExpired => hasSubscription && !isActive && !isFailedPayment;

  bool get hasPremiumSubscription =>
      hasActiveSubscription && subscription!.isPremium;
}
