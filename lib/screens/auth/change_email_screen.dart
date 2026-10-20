import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../../i18n/translations.g.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/mystical_password_field.dart';
import '../../widgets/mystical_text_field.dart';
import '../../widgets/auth/auth_container.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/auth_validators.dart';
import '../../utils/error_utils.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _sendConfirmationLink() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.requestEmailChange(
      _emailController.text.trim(),
      authProvider.currentUser!.hasPassword ? _passwordController.text : null,
    );

    if (!mounted) return;

    if (success) {
      setState(() {
        _emailSent = true;
      });
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
    final user = context.watch<AuthProvider>().currentUser!;
    final hasEmail = user.email != null;

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
                title: Text(hasEmail ? t.ui.changeEmail : t.ui.addEmail),
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
                      const SizedBox(height: 40),
                      Icon(
                        Icons.alternate_email,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 40),
                      AuthContainer(
                        child: _emailSent
                            ? Column(
                                children: [
                                  Text(
                                    t.ui.checkYourEmail,
                                    style: AppTextStyles.getH4Style(context),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    t.ui.emailChangeLinkSent(
                                      email: _emailController.text.trim(),
                                    ),
                                    style: AppTextStyles.getBodyStyle(context),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    t.ui.checkSpamFolder,
                                    style:
                                        AppTextStyles.getCaptionStyle(context)
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    MysticalTextField(
                                      controller: _emailController,
                                      labelText: t.ui.newEmail,
                                      prefixIcon: Icons.email_outlined,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: user.hasPassword
                                          ? TextInputAction.next
                                          : TextInputAction.done,
                                      validator: (value) =>
                                          AuthValidators.validateEmail(
                                            value,
                                            t,
                                          ),
                                      onFieldSubmitted: user.hasPassword
                                          ? null
                                          : _sendConfirmationLink,
                                    ),
                                    if (user.hasPassword) ...[
                                      const SizedBox(height: 20),
                                      MysticalPasswordField(
                                        controller: _passwordController,
                                        labelText: t.ui.currentPassword,
                                        textInputAction: TextInputAction.done,
                                        validator: (value) =>
                                            AuthValidators.validateRequiredField(
                                              value,
                                              t,
                                            ),
                                        onFieldSubmitted: _sendConfirmationLink,
                                      ),
                                    ],
                                    const SizedBox(height: 24),
                                    Consumer<AuthProvider>(
                                      builder: (context, authProvider, child) {
                                        return GradientButton(
                                          text: t.ui.sendConfirmationLink,
                                          onPressed: _sendConfirmationLink,
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
