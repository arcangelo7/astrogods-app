import 'package:material_ui/material_ui.dart';

class AuthLinkBox extends StatelessWidget {
  final Widget child;

  const AuthLinkBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
