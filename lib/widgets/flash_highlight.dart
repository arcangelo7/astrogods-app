import 'package:material_ui/material_ui.dart';

/// Flashes a translucent primary-colored layer over [child] three times
/// when [active] becomes true.
class FlashHighlight extends StatefulWidget {
  final bool active;
  final Widget child;

  const FlashHighlight({super.key, required this.active, required this.child});

  @override
  State<FlashHighlight> createState() => _FlashHighlightState();
}

class _FlashHighlightState extends State<FlashHighlight>
    with SingleTickerProviderStateMixin {
  static const _flashes = 3;

  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  );

  @override
  void initState() {
    super.initState();
    if (widget.active) _flash();
  }

  @override
  void didUpdateWidget(FlashHighlight oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active && !oldWidget.active) _flash();
  }

  Future<void> _flash() async {
    for (var i = 0; i < _flashes; i++) {
      await _controller.forward();
      await _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.25 * _controller.value),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
      child: widget.child,
    );
  }
}
