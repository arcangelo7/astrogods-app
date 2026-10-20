import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_2_wrappers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/subscription_plan.dart';
import 'api_client.dart';
import 'auth_service.dart';

sealed class ApplePurchaseResult {}

class ApplePurchaseCompleted extends ApplePurchaseResult {
  final String tier;
  ApplePurchaseCompleted(this.tier);
}

class ApplePurchaseFailed extends ApplePurchaseResult {
  final String? serverMessage;
  ApplePurchaseFailed(this.serverMessage);
}

class ApplePurchaseCancelled extends ApplePurchaseResult {}

class AppleStoreService {
  static const products = {
    'it.astrogods.premium.monthly': (PlanTier.premium, PlanType.monthly),
    'it.astrogods.premium.semiannual': (PlanTier.premium, PlanType.semiannual),
    'it.astrogods.premium.annual': (PlanTier.premium, PlanType.annual),
    'it.astrogods.standard.monthly': (PlanTier.standard, PlanType.monthly),
    'it.astrogods.standard.semiannual': (
      PlanTier.standard,
      PlanType.semiannual,
    ),
    'it.astrogods.standard.annual': (PlanTier.standard, PlanType.annual),
  };

  // Failed verification and a transaction owned by another account.
  static const _refusedStatuses = {400, 409};

  static final manageSubscriptionsUrl = Uri.parse(
    'https://apps.apple.com/account/subscriptions',
  );

  static bool get isAvailable =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS);

  static final instance = AppleStoreService._();

  AppleStoreService._();

  final _results = StreamController<ApplePurchaseResult>.broadcast();

  Stream<ApplePurchaseResult> get results => _results.stream;

  // Unfinished transactions and renewals arrive on this stream at launch, so it is
  // observed for the whole life of the app.
  void start() {
    InAppPurchase.instance.purchaseStream.listen(
      (purchases) => purchases.forEach(_handlePurchase),
    );
  }

  Future<List<ProductDetails>> loadProducts() async {
    final response = await InAppPurchase.instance.queryProductDetails(
      products.keys.toSet(),
    );
    if (response.error != null || response.notFoundIDs.isNotEmpty) {
      throw StateError(
        'App Store products unavailable: ${response.error?.message} ${response.notFoundIDs}',
      );
    }
    return response.productDetails;
  }

  Future<bool> isTrialEligible() =>
      SK2Product.isIntroductoryOfferEligible(products.keys.first);

  Future<void> buy(ProductDetails product) => InAppPurchase.instance
      .buyNonConsumable(purchaseParam: PurchaseParam(productDetails: product));

  Future<void> restore() => InAppPurchase.instance.restorePurchases();

  Future<void> openManageSubscriptions() async {
    await launchUrl(
      manageSubscriptionsUrl,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _handlePurchase(PurchaseDetails purchase) async {
    switch (purchase.status) {
      case PurchaseStatus.pending:
        return;
      case PurchaseStatus.canceled:
        await InAppPurchase.instance.completePurchase(purchase);
        _results.add(ApplePurchaseCancelled());
      case PurchaseStatus.error:
        await InAppPurchase.instance.completePurchase(purchase);
        _results.add(ApplePurchaseFailed(null));
      case PurchaseStatus.purchased:
      case PurchaseStatus.restored:
        await _recordPurchase(purchase);
    }
  }

  // A transaction stays unfinished until the server records or refuses it, so StoreKit
  // delivers it again at the next launch when the user is logged out, the session has
  // expired or the device is offline.
  Future<void> _recordPurchase(PurchaseDetails purchase) async {
    if (await AuthService().getToken() == null) {
      return;
    }
    try {
      final response = await ApiClient().post(
        '/apple/transactions',
        body: {
          'signed_transaction':
              purchase.verificationData.serverVerificationData,
        },
      );
      await InAppPurchase.instance.completePurchase(purchase);
      _results.add(ApplePurchaseCompleted(response['tier'] as String));
    } on ApiException catch (e) {
      final serverAnswered = e.statusCode != null;
      if (_refusedStatuses.contains(e.statusCode)) {
        await InAppPurchase.instance.completePurchase(purchase);
      }
      _results.add(ApplePurchaseFailed(serverAnswered ? e.message : null));
    }
  }
}
