import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'sky_diagram_shared.dart';

class CelestialSphereDiagram extends StatefulWidget {
  const CelestialSphereDiagram({super.key});

  @override
  State<CelestialSphereDiagram> createState() => _CelestialSphereDiagramState();
}

class _CelestialSphereDiagramState extends State<CelestialSphereDiagram> {
  double _hour = 6.0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = Translations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartWidth = min(420.0, w - 32);
        final chartHeight = chartWidth * 1.25;
        final sliderW = min(400.0, w - 32);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  width: chartWidth,
                  height: chartHeight,
                  child: CustomPaint(
                    painter: _DiurnalArcPainter(
                      hour: _hour,
                      color: color,
                      isDark: isDark,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _hour,
                  max: 24,
                  divisions: 96,
                  onChanged: (v) => setState(() => _hour = v),
                ),
              ),
              _timeLabels(sliderW, color),
            ],
          ),
        );
      },
    );
  }

  Widget _timeLabels(double width, Color color) {
    const pad = 20.0;
    final track = width - 2 * pad;
    final style = TextStyle(color: color, fontSize: 11);
    final items = [
      (0.0, '0h'),
      (6.0, '6h'),
      (12.0, '12h'),
      (18.0, '18h'),
      (24.0, '24h'),
    ];

    return SizedBox(
      width: width,
      height: 18,
      child: Stack(
        clipBehavior: Clip.none,
        children: items.map((c) {
          final (hour, name) = c;
          return Positioned(
            left: pad + (hour / 24) * track,
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

class _DiurnalArcPainter extends CustomPainter {
  final double hour;
  final Color color;
  final bool isDark;
  final Translations t;

  const _DiurnalArcPainter({
    required this.hour,
    required this.color,
    required this.isDark,
    required this.t,
  });

  double _a(double v) => skyDiagramAlpha(isDark, v);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);

    final w = size.width;
    final h = size.height;
    final horizonY = h * 0.45;
    final cx = w / 2;
    final arcRadius = w * 0.40;

    _drawSkyDome(canvas, cx, horizonY, arcRadius);
    _drawGround(canvas, w, h, horizonY);
    _drawHorizon(canvas, w, horizonY);
    _drawMeridian(canvas, cx, horizonY, arcRadius);
    _drawDiurnalArc(canvas, cx, horizonY, arcRadius);
    _drawStar(canvas, cx, horizonY, arcRadius);
    _drawLabels(canvas, w, h, horizonY, cx, arcRadius);
  }

  void _drawSkyDome(Canvas canvas, double cx, double horizonY, double r) {
    drawSkyDomeArc(
      canvas: canvas,
      center: Offset(cx, horizonY),
      radius: r,
      color: color,
      alpha: _a(0.15),
    );

    _drawDashedArc(
      canvas,
      cx,
      horizonY,
      r,
      0,
      pi,
      color.withValues(alpha: _a(0.1)),
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

  void _drawMeridian(Canvas canvas, double cx, double horizonY, double r) {
    final dashPaint = Paint()
      ..color = color.withValues(alpha: _a(0.25))
      ..strokeWidth = 1.0;

    drawDashedLine(
      canvas,
      Offset(cx, horizonY),
      Offset(cx, horizonY - r),
      dashPaint,
    );
    drawDashedLine(
      canvas,
      Offset(cx, horizonY),
      Offset(cx, horizonY + r),
      dashPaint,
    );
  }

  void _drawDiurnalArc(Canvas canvas, double cx, double horizonY, double r) {
    final path = Path();
    const steps = 60;
    for (int i = 0; i <= steps; i++) {
      final angle = pi + (pi * i / steps);
      final x = cx + r * cos(angle);
      final y = horizonY + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withValues(alpha: _a(0.3))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    _drawDashedArc(
      canvas,
      cx,
      horizonY,
      r,
      0,
      pi,
      color.withValues(alpha: _a(0.15)),
    );
  }

  void _drawStar(Canvas canvas, double cx, double horizonY, double r) {
    final fraction = hour / 24.0;
    final visible = fraction >= 0.25 && fraction <= 0.75;

    final angle = pi / 2 + (fraction * 2 * pi);
    final sx = cx + r * cos(angle);
    final sy = horizonY + r * sin(angle);

    if (visible) {
      canvas.drawCircle(
        Offset(sx, sy),
        5,
        Paint()..color = color.withValues(alpha: _a(0.9)),
      );
    } else {
      canvas.drawCircle(
        Offset(sx, sy),
        5,
        Paint()
          ..color = color.withValues(alpha: _a(0.3))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    }

    if (fraction > 0.25 && fraction <= 0.75) {
      final trailPath = Path();
      const startFrac = 0.25;
      const trailSteps = 40;
      final range = fraction - startFrac;
      for (int i = 0; i <= trailSteps; i++) {
        final f = startFrac + range * i / trailSteps;
        final a = pi / 2 + (f * 2 * pi);
        final x = cx + r * cos(a);
        final y = horizonY + r * sin(a);
        if (i == 0) {
          trailPath.moveTo(x, y);
        } else {
          trailPath.lineTo(x, y);
        }
      }
      canvas.drawPath(
        trailPath,
        Paint()
          ..color = color.withValues(alpha: _a(0.6))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
      );
    }
  }

  void _drawLabels(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double cx,
    double r,
  ) {
    drawCenteredText(
      canvas,
      t.codex.diagramEast,
      cx - r,
      horizonY + 18,
      13,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramWest,
      cx + r,
      horizonY + 18,
      13,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramHorizon,
      w * 0.82,
      horizonY - 14,
      11,
      color.withValues(alpha: _a(0.5)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramZenith,
      cx,
      horizonY - r - 20,
      12,
      color.withValues(alpha: _a(0.6)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramNadir,
      cx,
      horizonY + r + 20,
      12,
      color.withValues(alpha: _a(0.6)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramMeridian,
      cx + 45,
      horizonY - r * 0.5,
      11,
      color.withValues(alpha: _a(0.5)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramEarth,
      cx,
      h - 14,
      12,
      color.withValues(alpha: _a(0.4)),
    );
  }

  void _drawDashedArc(
    Canvas canvas,
    double cx,
    double horizonY,
    double r,
    double startAngle,
    double sweepAngle,
    Color c,
  ) {
    const steps = 60;
    const dashSteps = 3;
    const gapSteps = 2;
    final paint = Paint()
      ..color = c
      ..strokeWidth = 1.0;

    for (int i = 0; i < steps; i++) {
      if (i % (dashSteps + gapSteps) >= dashSteps) continue;
      final a1 = startAngle + (i / steps) * sweepAngle;
      final a2 = startAngle + ((i + 1) / steps) * sweepAngle;
      canvas.drawLine(
        Offset(cx + r * cos(a1), horizonY + r * sin(a1)),
        Offset(cx + r * cos(a2), horizonY + r * sin(a2)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DiurnalArcPainter old) =>
      hour != old.hour ||
      color != old.color ||
      isDark != old.isDark ||
      t != old.t;
}
