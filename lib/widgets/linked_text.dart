import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/email_utils.dart';

/// Text whose `[label](target)` segments are tappable links. Targets that
/// start with `/` open an app route; any other target opens externally.
class LinkedText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const LinkedText(this.text, {super.key, required this.style});

  @override
  State<LinkedText> createState() => _LinkedTextState();
}

class _LinkedTextState extends State<LinkedText> {
  static final _linkPattern = RegExp(r'\[([^\]]+)\]\(([^)]+)\)');

  final List<TapGestureRecognizer> _recognizers = [];

  void _disposeRecognizers() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  void _open(String target) {
    if (target.startsWith('/')) {
      context.push(target);
    } else if (target.startsWith('mailto:')) {
      openEmail(context, target.substring('mailto:'.length));
    } else {
      launchUrl(Uri.parse(target), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    _disposeRecognizers();
    final linkColor = Theme.of(context).colorScheme.primary;
    final linkStyle = widget.style.copyWith(
      color: linkColor,
      decoration: TextDecoration.underline,
      decorationColor: linkColor,
    );
    final spans = <InlineSpan>[];
    var position = 0;
    for (final match in _linkPattern.allMatches(widget.text)) {
      spans.add(TextSpan(text: widget.text.substring(position, match.start)));
      final recognizer = TapGestureRecognizer()
        ..onTap = () => _open(match.group(2)!);
      _recognizers.add(recognizer);
      spans.add(
        TextSpan(
          text: match.group(1),
          style: linkStyle,
          recognizer: recognizer,
          mouseCursor: SystemMouseCursors.click,
        ),
      );
      position = match.end;
    }
    spans.add(TextSpan(text: widget.text.substring(position)));
    return Text.rich(TextSpan(style: widget.style, children: spans));
  }
}
