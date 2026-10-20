import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../i18n/translations.g.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/mystical_password_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../widgets/auth/auth_link_box.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _savePassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.changePassword(
      _currentPasswordController.text,
      _newPasswordController.text,
    );

    if (!mounted) return;

    if (success) {
      SnackbarUtils.showSuccess(
        context,
        Translations.of(context).ui.passwordChanged,
      );
      context.pop();
    } else {
      SnackbarUtils.showError(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
  }

  Future<void> _sendResetLink() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final email = authProvider.currentUser!.email!;
    final success = await authProvider.forgotPassword(email);

    if (!mounted) return;

    if (success) {
      SnackbarUtils.showSuccess(
        context,
        Translations.of(context).ui.resetLinkSent(email: email),
      );
    } else {
      SnackbarUtils.showError(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: false,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(t.ui.changePassword),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                    bottom: MediaQuery.of(context).padding.bottom + 24,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 32),
                      AuthContainer(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MysticalPasswordField(
                                controller: _currentPasswordController,
                                labelText: t.ui.currentPassword,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    AuthValidators.validateRequiredField(
                                      value,
                                      t,
                                    ),
                              ),
                              const SizedBox(height: 20),
                              MysticalPasswordField(
                                controller: _newPasswordController,
                                labelText: t.ui.newPassword,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    AuthValidators.validatePassword(value, t),
                              ),
                              const SizedBox(height: 20),
                              MysticalPasswordField(
                                controller: _confirmPasswordController,
                                labelText: t.ui.confirmNewPassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    AuthValidators.validateConfirmPassword(
                                      value,
                                      _newPasswordController.text,
                                      t,
                                    ),
                                onFieldSubmitted: _savePassword,
                              ),
                              const SizedBox(height: 24),
                              Consumer<AuthProvider>(
                                builder: (context, authProvider, child) {
                                  return GradientButton(
                                    text: t.ui.savePassword,
                                    onPressed: _savePassword,
                                    enabled: !authProvider.isLoading,
                                    isLoading: authProvider.isLoading,
                                    width: double.infinity,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AuthLinkBox(
                        child: TextButton(
                          onPressed: _sendResetLink,
                          child: Text(
                            t.ui.forgotPassword,
                            style: AppTextStyles.getLinkStyle(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
