import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'sky_diagram_shared.dart';

class EclipticRisingComparisonDiagram extends StatelessWidget {
  const EclipticRisingComparisonDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = Translations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartWidth = min(420.0, w - 32);
        final chartHeight = chartWidth * 0.7;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: SizedBox(
              width: chartWidth,
              height: chartHeight,
              child: CustomPaint(
                painter: _ComparisonPainter(color: color, isDark: isDark, t: t),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ComparisonPainter extends CustomPainter {
  final Color color;
  final bool isDark;
  final Translations t;

  const _ComparisonPainter({
    required this.color,
    required this.isDark,
    required this.t,
  });

  double _a(double v) => skyDiagramAlpha(isDark, v);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final gap = w * 0.06;
    final panelW = (w - gap) / 2;

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, panelW, h));
    _drawPanel(canvas, panelW, h, 75.0, t.codex.diagramSlowRising);
    canvas.restore();

    canvas.save();
    canvas.translate(panelW + gap, 0);
    canvas.clipRect(Rect.fromLTWH(0, 0, panelW, h));
    _drawPanel(canvas, panelW, h, 25.0, t.codex.diagramFastRising);
    canvas.restore();
  }

  void _drawPanel(
    Canvas canvas,
    double w,
    double h,
    double eclipticAngleDeg,
    String label,
  ) {
    final horizonY = h * 0.75;
    final risingX = w * 0.28;

    _drawSkyDome(canvas, w, horizonY);
    _drawGround(canvas, w, h, horizonY);
    _drawHorizon(canvas, w, horizonY);
    _drawEclipticLine(canvas, w, h, horizonY, risingX, eclipticAngleDeg);
    _drawRisingBand(canvas, w, h, horizonY, risingX, eclipticAngleDeg);
    _drawAngleArc(canvas, risingX, horizonY, eclipticAngleDeg);

    drawCenteredText(
      canvas,
      t.codex.diagramEast,
      risingX,
      horizonY + 13,
      11,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramHorizon,
      w * 0.75,
      horizonY + 13,
      11,
      color.withValues(alpha: _a(0.5)),
    );
    drawCenteredText(
      canvas,
      label,
      w * 0.5,
      h * 0.08,
      12,
      color.withValues(alpha: _a(0.9)),
    );

    final angleRad = eclipticAngleDeg * pi / 180;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);
    final labelDist = min(w * 0.32, h * 0.35);
    final perpX = -sin(angleRad);
    final perpY = -cos(angleRad);
    drawCenteredText(
      canvas,
      t.codex.diagramEcliptic,
      risingX + dx * labelDist + perpX * 12,
      horizonY + dy * labelDist + perpY * 12,
      11,
      color.withValues(alpha: _a(0.7)),
    );
  }

  void _drawSkyDome(Canvas canvas, double w, double horizonY) {
    drawSkyDomeArc(
      canvas: canvas,
      center: Offset(w / 2, horizonY),
      radius: w * 0.46,
      color: color,
      alpha: _a(0.15),
    );
  }

  void _drawGround(Canvas canvas, double w, double h, double horizonY) {
    drawGroundRect(
      canvas: canvas,
      width: w,
      height: h,
      horizonY: horizonY,
      color: color,
      alpha: _a(0.06),
    );
  }

  void _drawHorizon(Canvas canvas, double w, double horizonY) {
    drawHorizonLine(
      canvas: canvas,
      width: w,
      horizonY: horizonY,
      color: color,
      alpha: _a(0.8),
    );
  }

  void _drawEclipticLine(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
    double angleDeg,
  ) {
    final angleRad = angleDeg * pi / 180;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);
    final lineLen = max(w, h);

    canvas.drawLine(
      Offset(risingX, horizonY),
      Offset(risingX + dx * lineLen, horizonY + dy * lineLen),
      Paint()
        ..color = color.withValues(alpha: _a(0.7))
        ..strokeWidth = 1.5,
    );

    canvas.drawLine(
      Offset(risingX - dx * 20, horizonY - dy * 20),
      Offset(risingX, horizonY),
      Paint()
        ..color = color.withValues(alpha: _a(0.15))
        ..strokeWidth = 1.0,
    );

    _drawTicks(canvas, w, h, horizonY, risingX, dx, dy, angleRad);
  }

  void _drawTicks(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
    double dx,
    double dy,
    double angleRad,
  ) {
    const tickSpacing = 12.0;
    const tickHalf = 4.0;
    const bandHeight = 28.0;
    final perpX = sin(angleRad);
    final perpY = cos(angleRad);

    final dimPaint = Paint()
      ..color = color.withValues(alpha: _a(0.15))
      ..strokeWidth = 0.8;
    final normalPaint = Paint()
      ..color = color.withValues(alpha: _a(0.4))
      ..strokeWidth = 1.0;
    final highlightPaint = Paint()
      ..color = color.withValues(alpha: _a(0.95))
      ..strokeWidth = 2.2;

    for (int i = -3; i <= 25; i++) {
      final cx = risingX + dx * tickSpacing * i;
      final cy = horizonY + dy * tickSpacing * i;

      if (cx < -5 || cx > w + 5 || cy < -5 || cy > h + 5) continue;

      final aboveHorizon = cy <= horizonY;
      final distAbove = horizonY - cy;

      if (!aboveHorizon) {
        if (distAbove.abs() > 4) {
          canvas.drawLine(
            Offset(cx - perpX * tickHalf * 0.7, cy - perpY * tickHalf * 0.7),
            Offset(cx + perpX * tickHalf * 0.7, cy + perpY * tickHalf * 0.7),
            dimPaint,
          );
        }
        continue;
      }

      final inBand = distAbove <= bandHeight;
      final paint = inBand ? highlightPaint : normalPaint;
      final th = inBand ? tickHalf * 1.3 : tickHalf;

      canvas.drawLine(
        Offset(cx - perpX * th, cy - perpY * th),
        Offset(cx + perpX * th, cy + perpY * th),
        paint,
      );
    }
  }

  void _drawRisingBand(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
    double angleDeg,
  ) {
    final angleRad = angleDeg * pi / 180;
    const bandHeight = 28.0;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);

    final bandEndDist = bandHeight / sin(angleRad).abs().clamp(0.1, 1.0);
    final endX = risingX + dx * bandEndDist;
    final endY = horizonY + dy * bandEndDist;

    if (endY < horizonY) {
      final path = Path()
        ..moveTo(risingX, horizonY)
        ..lineTo(endX, endY)
        ..lineTo(endX, horizonY)
        ..close();

      canvas.drawPath(
        path,
        Paint()
          ..color = color.withValues(alpha: _a(0.08))
          ..style = PaintingStyle.fill,
      );
    }
  }

  void _drawAngleArc(Canvas canvas, double cx, double cy, double angleDeg) {
    const arcRadius = 30.0;
    final angleRad = angleDeg * pi / 180;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: arcRadius),
      0,
      -angleRad,
      false,
      Paint()
        ..color = color.withValues(alpha: _a(0.4))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    final midAngle = -angleRad / 2;
    drawCenteredText(
      canvas,
      '${angleDeg.round()}\u00b0',
      cx + (arcRadius + 11) * cos(midAngle),
      cy + (arcRadius + 11) * sin(midAngle),
      11,
      color.withValues(alpha: _a(0.6)),
    );
  }

  @override
  bool shouldRepaint(covariant _ComparisonPainter old) =>
      color != old.color || isDark != old.isDark || t != old.t;
}
