import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../i18n/translations.g.dart';
import '../../providers/auth_provider.dart';
import '../../utils/auth_navigation_utils.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/error_utils.dart';

final bool supportsAppleSignIn =
    !kIsWeb && (Platform.isIOS || Platform.isMacOS);

class AppleSignInButton extends StatelessWidget {
  final bool isRegisterMode;

  const AppleSignInButton({super.key, this.isRegisterMode = false});

  Future<void> _handleAppleSignIn(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final t = Translations.of(context);

    final AuthorizationCredentialAppleID credential;
    try {
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled || !context.mounted) {
        return;
      }
      SnackbarUtils.showCopyableErrorSnackBar(
        context,
        isRegisterMode
            ? t.ui.appleSignUpError(error: e.message)
            : t.ui.appleSignInError(error: e.message),
      );
      return;
    }

    if (!context.mounted) return;

    final response = await authProvider.loginWithApple(
      identityToken: credential.identityToken!,
      authorizationCode: credential.authorizationCode,
      givenName: credential.givenName,
      familyName: credential.familyName,
    );

    if (!context.mounted) return;

    if (response.success) {
      showAuthSuccess(context, created: response.created);
      await navigateAfterAuth();
    } else {
      SnackbarUtils.showCopyableErrorSnackBar(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: SignInButton(
          Buttons.apple,
          text: Translations.of(context).ui.continueWithApple,
          onPressed: () => _handleAppleSignIn(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8.0,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
