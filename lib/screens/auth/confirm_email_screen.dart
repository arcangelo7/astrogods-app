import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../i18n/translations.g.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/starry_night_background.dart';
import '../../constants/text_styles.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/error_utils.dart';

class ConfirmEmailScreen extends StatefulWidget {
  final String token;

  const ConfirmEmailScreen({super.key, required this.token});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _confirm());
  }

  Future<void> _confirm() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.confirmEmailChange(widget.token);

    if (!mounted) return;

    if (success) {
      SnackbarUtils.showSuccess(
        context,
        Translations.of(context).ui.emailChangeConfirmed,
      );
    } else {
      SnackbarUtils.showError(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
    context.go(authProvider.isAuthenticated ? '/profile' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarryNightBackground(
        showPlanet: true,
        subtle: false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 24),
              Text(
                Translations.of(context).ui.confirmingEmail,
                style: AppTextStyles.getBodyStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
