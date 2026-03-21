// SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import '../models/google_user_data.dart';
import 'google_sign_in_desktop_service.dart';

class GoogleSignInNativeService {
  static final GoogleSignInNativeService _instance =
      GoogleSignInNativeService._internal();
  factory GoogleSignInNativeService() => _instance;
  GoogleSignInNativeService._internal();

  bool _isInitialized = false;

  Future<void> initialize(String? clientId) async {
    if (_isInitialized) return;

    final GoogleSignIn signIn = GoogleSignIn.instance;

    if (kIsWeb) {
      await signIn.initialize();
    } else {
      if (Platform.isAndroid) {
        await signIn.initialize(serverClientId: clientId);
      } else if (Platform.isIOS) {
        await signIn.initialize();
      } else {
        throw Exception('Use GoogleSignInDesktopService for desktop platforms');
      }
    }

    _isInitialized = true;
  }

  Future<GoogleUserData?> signIn() async {
    if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
      return GoogleSignInDesktopService().signIn();
    }

    try {
      if (!_isInitialized) {
        throw Exception(
            'GoogleSignInNativeService not initialized. Call initialize() first.');
      }

      if (!GoogleSignIn.instance.supportsAuthenticate()) {
        throw Exception('Authentication not supported on this platform');
      }

      final GoogleSignInAccount user =
          await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication auth = user.authentication;

      return GoogleUserData(
        id: user.id,
        name: user.displayName ?? '',
        email: user.email,
        imageUrl: user.photoUrl ?? '',
        idToken: auth.idToken ?? '',
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    }
  }
}
