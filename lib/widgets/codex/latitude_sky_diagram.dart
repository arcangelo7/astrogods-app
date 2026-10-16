import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'sky_diagram_shared.dart';

class LatitudeSkyDiagram extends StatefulWidget {
  const LatitudeSkyDiagram({super.key});

  @override
  State<LatitudeSkyDiagram> createState() => _LatitudeSkyDiagramState();
}

class _LatitudeSkyDiagramState extends State<LatitudeSkyDiagram> {
  double _latitude = 42.0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = Translations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartWidth = min(420.0, w - 32);
        final chartHeight = chartWidth * 0.85;
        final sliderW = min(400.0, w - 32);
        final narrow = w < 400;

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
                    painter: _LatitudeSkyPainter(
                      latitudeDeg: _latitude,
                      color: color,
                      isDark: isDark,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                t.codex.diagramLatitude(degrees: _latitude.round().toString()),
                style: TextStyle(color: color, fontSize: 13),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _latitude,
                  max: 90,
                  divisions: 90,
                  onChanged: (v) => setState(() => _latitude = v),
                ),
              ),
              LatitudeReferenceLabels(
                width: sliderW,
                narrow: narrow,
                color: color,
                maxLatitude: 90,
                maxLabel: t.codex.diagramPole,
                fontSize: 11,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LatitudeSkyPainter extends CustomPainter {
  final double latitudeDeg;
  final Color color;
  final bool isDark;
  final Translations t;

  const _LatitudeSkyPainter({
    required this.latitudeDeg,
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
    final horizonY = h * 0.7;
    final cx = w / 2;
    final r = w * 0.42;

    _drawSkyDome(canvas, cx, horizonY, r);
    _drawGround(canvas, w, h, horizonY);
    _drawHorizon(canvas, w, horizonY);
    _drawStarTrails(canvas, cx, horizonY, r);
    _drawCelestialPole(canvas, cx, horizonY, r);
    _drawLabels(canvas, w, horizonY, cx, r);
  }

  void _drawSkyDome(Canvas canvas, double cx, double horizonY, double r) {
    drawSkyDomeArc(
      canvas: canvas,
      center: Offset(cx, horizonY),
      radius: r,
      color: color,
      alpha: _a(0.2),
    );
  }

  void _drawGround(Canvas canvas, double w, double h, double horizonY) {
    drawGroundRect(
      canvas: canvas,
      width: w,
      height: h,
      horizonY: horizonY,
      color: color,
      alpha: _a(0.08),
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

  void _drawCelestialPole(Canvas canvas, double cx, double horizonY, double r) {
    final latRad = latitudeDeg * pi / 180;
    final poleY = horizonY - r * sin(latRad);

    canvas.drawCircle(
      Offset(cx, poleY),
      4,
      Paint()..color = color.withValues(alpha: _a(0.8)),
    );

    drawDashedLine(
      canvas,
      Offset(cx, horizonY),
      Offset(cx, poleY),
      Paint()
        ..color = color.withValues(alpha: _a(0.3))
        ..strokeWidth = 1.0,
    );
  }

  void _drawStarTrails(Canvas canvas, double cx, double horizonY, double r) {
    final latRad = latitudeDeg * pi / 180;
    final poleY = horizonY - r * sin(latRad);
    final circumPolarR = r * (latitudeDeg / 90);

    final circumPolarPaint = Paint()
      ..color = color.withValues(alpha: _a(0.15))
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, 0, cx * 2, horizonY));
    if (circumPolarR > 2) {
      canvas.drawCircle(Offset(cx, poleY), circumPolarR, circumPolarPaint);
    }
    canvas.restore();

    final trailPaint = Paint()
      ..color = color.withValues(alpha: _a(0.15))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    for (final frac in [0.2, 0.4, 0.6, 0.8]) {
      final trailR = r * frac;
      canvas.save();
      canvas.clipRect(Rect.fromLTRB(0, 0, cx * 2, horizonY));
      canvas.drawCircle(Offset(cx, poleY), trailR, trailPaint);
      canvas.restore();
    }

    _drawCelestialEquator(canvas, cx, horizonY, r, poleY);
  }

  void _drawCelestialEquator(
    Canvas canvas,
    double cx,
    double horizonY,
    double r,
    double poleY,
  ) {
    final equatorR = r;
    final eqPaint = Paint()
      ..color = color.withValues(alpha: _a(0.4))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, 0, cx * 2, horizonY));
    _drawDashedCircle(canvas, Offset(cx, poleY), equatorR, eqPaint);
    canvas.restore();

    if (latitudeDeg > 5) {
      final midY = (horizonY + poleY) / 2;
      final dy = midY - poleY;
      if (dy.abs() < equatorR) {
        final dx = sqrt(equatorR * equatorR - dy * dy);
        drawCenteredText(
          canvas,
          t.codex.diagramCelestialEquatorShort,
          cx + dx - 40,
          midY,
          11,
          color.withValues(alpha: _a(0.5)),
        );
      }
    }
  }

  void _drawDashedCircle(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint, {
    double dashLen = 6,
    double gapLen = 4,
  }) {
    final circumference = 2 * pi * radius;
    final totalSegments = circumference / (dashLen + gapLen);
    final anglePerSegment = 2 * pi / totalSegments;
    final dashAngle = anglePerSegment * dashLen / (dashLen + gapLen);

    for (var i = 0; i < totalSegments; i++) {
      final startAngle = i * anglePerSegment;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashAngle,
        false,
        paint,
      );
    }
  }

  void _drawLabels(
    Canvas canvas,
    double w,
    double horizonY,
    double cx,
    double r,
  ) {
    final latRad = latitudeDeg * pi / 180;
    final poleY = horizonY - r * sin(latRad);

    drawCenteredText(
      canvas,
      t.codex.diagramWest,
      cx - r,
      horizonY + 16,
      13,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramEast,
      cx + r,
      horizonY + 16,
      13,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramNorth,
      cx,
      horizonY + 16,
      11,
      color.withValues(alpha: _a(0.7)),
    );

    if (latitudeDeg > 5) {
      drawCenteredText(
        canvas,
        t.codex.diagramCelestialPole,
        cx,
        poleY - 14,
        12,
        color.withValues(alpha: _a(0.7)),
      );

      drawCenteredText(
        canvas,
        '${latitudeDeg.round()}\u00b0',
        cx + 16,
        (horizonY + poleY) / 2,
        11,
        color.withValues(alpha: _a(0.6)),
      );
    }

    drawCenteredText(
      canvas,
      t.codex.diagramHorizon,
      cx,
      horizonY - 14,
      11,
      color.withValues(alpha: _a(0.6)),
    );
  }

  @override
  bool shouldRepaint(covariant _LatitudeSkyPainter old) =>
      latitudeDeg != old.latitudeDeg ||
      color != old.color ||
      isDark != old.isDark ||
      t != old.t;
}
