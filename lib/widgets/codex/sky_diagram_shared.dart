import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';

double skyDiagramAlpha(bool isDark, double value) {
  if (isDark) return value;
  return (value * 2.0).clamp(0.25, 1.0);
}

void drawSkyDomeArc({
  required Canvas canvas,
  required Offset center,
  required double radius,
  required Color color,
  required double alpha,
}) {
  canvas.drawArc(
    Rect.fromCircle(center: center, radius: radius),
    pi,
    pi,
    false,
    Paint()
      ..color = color.withValues(alpha: alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0,
  );
}

void drawGroundRect({
  required Canvas canvas,
  required double width,
  required double height,
  required double horizonY,
  required Color color,
  required double alpha,
}) {
  canvas.drawRect(
    Rect.fromLTRB(0, horizonY, width, height),
    Paint()..color = color.withValues(alpha: alpha),
  );
}

void drawHorizonLine({
  required Canvas canvas,
  required double width,
  required double horizonY,
  required Color color,
  required double alpha,
}) {
  canvas.drawLine(
    Offset(0, horizonY),
    Offset(width, horizonY),
    Paint()
      ..color = color.withValues(alpha: alpha)
      ..strokeWidth = 1.5,
  );
}

void drawDashedLine(
  Canvas canvas,
  Offset start,
  Offset end,
  Paint paint, {
  double dashLen = 5,
  double gapLen = 4,
}) {
  final total = (end - start).distance;
  if (total < 1) return;

  final direction = (end - start) / total;
  var drawn = 0.0;

  while (drawn < total) {
    final dashStart = start + direction * drawn;
    final dashEnd = start + direction * min(drawn + dashLen, total);
    canvas.drawLine(dashStart, dashEnd, paint);
    drawn += dashLen + gapLen;
  }
}

void drawCenteredText(
  Canvas canvas,
  String text,
  double centerX,
  double centerY,
  double fontSize,
  Color color,
) {
  final painter = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(color: color, fontSize: fontSize),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  painter.paint(
    canvas,
    Offset(centerX - painter.width / 2, centerY - painter.height / 2),
  );
}

class LatitudeReferenceLabels extends StatelessWidget {
  final double width;
  final bool narrow;
  final Color color;
  final double maxLatitude;
  final String maxLabel;
  final double fontSize;

  const LatitudeReferenceLabels({
    required this.width,
    required this.narrow,
    required this.color,
    required this.maxLatitude,
    required this.maxLabel,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final items = narrow
        ? [
            (0.0, t.codex.diagramEquator),
            (42.0, t.codex.diagramRome),
            (maxLatitude, maxLabel),
          ]
        : [
            (0.0, t.codex.diagramEquator),
            (42.0, t.codex.diagramRome),
            (66.0, t.codex.diagramPolarCircleShort),
            (maxLatitude, maxLabel),
          ];
    const pad = 20.0;
    final track = width - 2 * pad;
    final style = TextStyle(color: color, fontSize: fontSize);

    return SizedBox(
      width: width,
      height: fontSize + 7,
      child: Stack(
        clipBehavior: Clip.none,
        children: items.map((item) {
          final (latitude, name) = item;
          return Positioned(
            left: pad + (latitude / maxLatitude) * track,
            top: 0,
            child: FractionalTranslation(
              translation: const Offset(-0.5, 0),
              child: Text(name, style: style),
            ),
          );
        }).toList(),
      ),
    );
  }
}
