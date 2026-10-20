// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
  id: json['id'] as String,
  source: json['source'] as String,
  status: json['status'] as String,
  currentPeriodStart: (json['current_period_start'] as num?)?.toInt(),
  currentPeriodEnd: (json['current_period_end'] as num?)?.toInt(),
  cancelAtPeriodEnd: json['cancel_at_period_end'] as bool,
  tier: json['tier'] as String,
  period: json['period'] as String,
  amount: (json['amount'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  platform: json['platform'] as String?,
);

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'status': instance.status,
      'current_period_start': instance.currentPeriodStart,
      'current_period_end': instance.currentPeriodEnd,
      'cancel_at_period_end': instance.cancelAtPeriodEnd,
      'tier': instance.tier,
      'period': instance.period,
      'amount': instance.amount,
      'currency': instance.currency,
      'platform': instance.platform,
    };

SubscriptionStatusResponse _$SubscriptionStatusResponseFromJson(
  Map<String, dynamic> json,
) => SubscriptionStatusResponse(
  subscription: json['subscription'] == null
      ? null
      : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  hasActiveSubscription: json['has_active_subscription'] as bool,
  hasTrialEligibility: json['has_trial_eligibility'] as bool? ?? true,
);

Map<String, dynamic> _$SubscriptionStatusResponseToJson(
  SubscriptionStatusResponse instance,
) => <String, dynamic>{
  'subscription': instance.subscription,
  'has_active_subscription': instance.hasActiveSubscription,
  'has_trial_eligibility': instance.hasTrialEligibility,
};
