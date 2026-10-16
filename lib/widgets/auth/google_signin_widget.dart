import 'dart:async';
import 'dart:io' show Platform;

import 'package:material_ui/material_ui.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../i18n/translations.g.dart';
import '../../providers/auth_provider.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../services/auth_service.dart';
import '../../services/google_sign_in_native_service.dart';
import '../../services/google_sign_in_desktop_service.dart';
import '../../utils/auth_navigation_utils.dart';
import 'google_signin_button.dart';

class GoogleSignInWidget extends StatefulWidget {
  final bool isRegisterMode;

  const GoogleSignInWidget({super.key, this.isRegisterMode = false});

  @override
  State<GoogleSignInWidget> createState() => _GoogleSignInWidgetState();
}

class _GoogleSignInWidgetState extends State<GoogleSignInWidget> {
  final GoogleSignInNativeService _googleNativeService =
      GoogleSignInNativeService();
  // Static subscription ensures only one listener exists across all widget instances
  static StreamSubscription<GoogleSignInAuthenticationEvent>?
  _authEventSubscription;
  static _GoogleSignInWidgetState? _activeInstance;
  static bool _isHandlingSignIn = false;
  bool _isInitialized = false;
  bool _isInitializing = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    if (_isInitializing || _isInitialized) return;

    setState(() {
      _isInitializing = true;
      _initError = null;
    });

    try {
      final authService = AuthService(context: context);
      final config = await authService.getOAuthConfig();

      if (kIsWeb) {
        await GoogleSignIn.instance.initialize();
        _setupWebAuthListener();
      } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
        await GoogleSignInDesktopService().initialize(
          config['clientId']!,
          config['clientSecret']!,
        );
      } else {
        await _googleNativeService.initialize(config['clientId']);
      }

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _isInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _initError = e.toString();
          _isInitializing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    if (_activeInstance == this) {
      _authEventSubscription?.cancel();
      _authEventSubscription = null;
      _activeInstance = null;
      _isHandlingSignIn = false;
    }
    super.dispose();
  }

  void _setupWebAuthListener() {
    _authEventSubscription?.cancel();
    _activeInstance = this;

    _authEventSubscription = GoogleSignIn.instance.authenticationEvents.listen((
      event,
    ) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        // Prevent handling duplicate events
        if (_isHandlingSignIn) return;
        if (_activeInstance == this && mounted) {
          _isHandlingSignIn = true;
          _handleWebSignInComplete(event.user);
        }
      }
    });
  }

  Future<void> _handleWebSignInComplete(GoogleSignInAccount user) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final auth = user.authentication;
      final success = await authProvider.loginWithGoogle(
        idToken: auth.idToken ?? '',
        context: context,
      );

      if (mounted) {
        if (success) {
          await navigateAfterAuth();
        } else {
          SnackbarUtils.showCopyableErrorSnackBar(
            context,
            authProvider.errorMessage!,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        final t = Translations.of(context);
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? t.ui.googleSignUpError(error: e.toString())
              : t.ui.googleSignInError(error: e.toString()),
        );
      }
    }
  }

  Future<void> _handleGoogleSignIn() async {
    if (kIsWeb) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      final googleUser = await _googleNativeService.signIn();

      if (googleUser != null && mounted) {
        final success = await authProvider.loginWithGoogle(
          idToken: googleUser.idToken,
          context: context,
        );

        if (mounted) {
          if (success) {
            await navigateAfterAuth();
          } else {
            SnackbarUtils.showCopyableErrorSnackBar(
              context,
              authProvider.errorMessage!,
            );
          }
        }
      } else {
        authProvider.stopLoading();
      }
    } on GoogleSignInException catch (e) {
      authProvider.stopLoading();

      if (mounted) {
        if (e.code == GoogleSignInExceptionCode.canceled) {
          return;
        }

        final t = Translations.of(context);
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? t.ui.googleSignUpError(error: e.toString())
              : t.ui.googleSignInError(error: e.toString()),
        );
      }
    } catch (e) {
      authProvider.stopLoading();

      if (mounted) {
        final t = Translations.of(context);
        SnackbarUtils.showCopyableErrorSnackBar(
          context,
          widget.isRegisterMode
              ? t.ui.googleSignUpError(error: e.toString())
              : t.ui.googleSignInError(error: e.toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return const SizedBox.shrink();
    }

    final t = Translations.of(context);

    return Column(
      children: [
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                t.ui.or,
                style: AppTextStyles.getCaptionStyle(context),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        if (!_isInitialized)
          SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const CircularProgressIndicator(),
            ),
          )
        else if (kIsWeb)
          const SizedBox(
            width: double.infinity,
            height: 56,
            child: GoogleSignInButtonWeb(),
          )
        else
          SizedBox(
            width: double.infinity,
            height: 56,
            child: SignInButton(
              Buttons.google,
              text: t.ui.continueWithGoogle,
              onPressed: _handleGoogleSignIn,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 8.0,
              padding: EdgeInsets.zero,
            ),
          ),
      ],
    );
  }
}
