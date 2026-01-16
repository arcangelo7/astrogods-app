import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../models/subscription.dart';
import '../services/subscription_service.dart';

mixin SubscriptionLoaderMixin<T extends StatefulWidget> on State<T> {
  SubscriptionStatusResponse? subscriptionStatus;
  bool isRegenerating = false;

  Future<void> loadSubscriptionStatus() async {
    try {
      final subscriptionService = SubscriptionService(context: context);
      final status = await subscriptionService.getSubscriptionStatus();
      if (mounted) {
        setState(() {
          subscriptionStatus = status;
        });
      }
    } catch (e) {
      developer.log(
        'Failed to load subscription status: $e',
        name: 'SubscriptionLoaderMixin',
      );
    }
  }

  void startRegeneration(VoidCallback clearState, VoidCallback generate) {
    if (isRegenerating) return;

    setState(() {
      isRegenerating = true;
    });

    clearState();
    generate();
  }

  void onRegenerationComplete() {
    if (mounted) {
      setState(() {
        isRegenerating = false;
      });
    }
  }

  void onRegenerationError() {
    if (mounted) {
      setState(() {
        isRegenerating = false;
      });
    }
  }
}
