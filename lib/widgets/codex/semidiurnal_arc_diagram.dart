import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import '../../utils/ecliptic_horizon_geometry.dart';
import 'sky_diagram_shared.dart';

class SemidiurnalArcDiagram extends StatefulWidget {
  const SemidiurnalArcDiagram({super.key});

  @override
  State<SemidiurnalArcDiagram> createState() => _SemidiurnalArcDiagramState();
}

class _SemidiurnalArcDiagramState extends State<SemidiurnalArcDiagram> {
  double _latitude = 42.0;
  double _hour = 0.0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final t = Translations.of(context);
    final geometry = eclipticHorizonForSiderealHours(
      latitudeDeg: _latitude,
      siderealHours: _hour,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartWidth = min(420.0, w - 32);
        final chartHeight = chartWidth * 0.75;
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
                    painter: _SemidiurnalPainter(
                      latitudeDeg: _latitude,
                      equatorAngleDeg: 90.0 - _latitude,
                      eclipticAngleDeg: geometry.horizonAngleDeg,
                      risingSpeed: geometry.ascendantSpeed,
                      color: color,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t.codex.diagramLatitude(degrees: _latitude.round().toString()),
                style: TextStyle(color: color, fontSize: 14),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _latitude,
                  max: 89,
                  divisions: 89,
                  onChanged: (v) => setState(() => _latitude = v),
                ),
              ),
              LatitudeReferenceLabels(
                width: sliderW,
                narrow: narrow,
                color: color,
                maxLatitude: 89,
                maxLabel: '89°',
                fontSize: 9,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _hour,
                  max: 24,
                  divisions: 48,
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
    final style = TextStyle(color: color, fontSize: 9);
    final items = [(0.0, '0h'), (12.0, '12h'), (24.0, '24h')];

    return SizedBox(
      width: width,
      height: 16,
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

class _SemidiurnalPainter extends CustomPainter {
  final double latitudeDeg;
  final double equatorAngleDeg;
  final double eclipticAngleDeg;
  final double risingSpeed;
  final Color color;
  final Translations t;

  const _SemidiurnalPainter({
    required this.latitudeDeg,
    required this.equatorAngleDeg,
    required this.eclipticAngleDeg,
    required this.risingSpeed,
    required this.color,
    required this.t,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);

    final w = size.width;
    final h = size.height;
    final horizonY = h * 0.78;
    final risingX = w * 0.25;

    _drawSkyDome(canvas, w, horizonY);
    _drawGround(canvas, w, h, horizonY);
    _drawHorizon(canvas, w, horizonY);
    _drawEquator(canvas, w, h, horizonY, risingX);
    _drawEcliptic(canvas, w, h, horizonY, risingX);
    _drawRisingBand(canvas, w, h, horizonY, risingX);
    _drawAngleBetween(canvas, risingX, horizonY);
    _drawLabels(canvas, w, h, horizonY, risingX);
  }

  void _drawSkyDome(Canvas canvas, double w, double horizonY) {
    drawSkyDomeArc(
      canvas: canvas,
      center: Offset(w / 2, horizonY),
      radius: w * 0.46,
      color: color,
      alpha: 0.15,
    );
  }

  void _drawGround(Canvas canvas, double w, double h, double horizonY) {
    drawGroundRect(
      canvas: canvas,
      width: w,
      height: h,
      horizonY: horizonY,
      color: color,
      alpha: 0.06,
    );
  }

  void _drawHorizon(Canvas canvas, double w, double horizonY) {
    drawHorizonLine(
      canvas: canvas,
      width: w,
      horizonY: horizonY,
      color: color,
      alpha: 0.8,
    );
  }

  void _drawEquator(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
  ) {
    final angleRad = equatorAngleDeg * pi / 180;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);
    final lineLen = max(w, h);

    drawDashedLine(
      canvas,
      Offset(risingX, horizonY),
      Offset(risingX + dx * lineLen, horizonY + dy * lineLen),
      Paint()
        ..color = color.withValues(alpha: 0.25)
        ..strokeWidth = 1.0,
    );
  }

  void _drawEcliptic(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
  ) {
    final angleRad = eclipticAngleDeg * pi / 180;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);
    final lineLen = max(w, h);

    canvas.drawLine(
      Offset(risingX, horizonY),
      Offset(risingX + dx * lineLen, horizonY + dy * lineLen),
      Paint()
        ..color = color.withValues(alpha: 0.7)
        ..strokeWidth = 1.5,
    );

    canvas.drawLine(
      Offset(risingX - dx * 25, horizonY - dy * 25),
      Offset(risingX, horizonY),
      Paint()
        ..color = color.withValues(alpha: 0.15)
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
    const tickSpacing = 14.0;
    const tickHalf = 4.5;
    const bandHeight = 30.0;
    final perpX = sin(angleRad);
    final perpY = cos(angleRad);

    final dimPaint = Paint()
      ..color = color.withValues(alpha: 0.15)
      ..strokeWidth = 0.8;
    final normalPaint = Paint()
      ..color = color.withValues(alpha: 0.4)
      ..strokeWidth = 1.0;
    final highlightPaint = Paint()
      ..color = color.withValues(alpha: 0.95)
      ..strokeWidth = 2.2;

    for (int i = -3; i <= 30; i++) {
      final cx = risingX + dx * tickSpacing * i;
      final cy = horizonY + dy * tickSpacing * i;

      if (cx < -5 || cx > w + 5 || cy < -5 || cy > h + 5) continue;

      final aboveHorizon = cy <= horizonY;
      final distAbove = horizonY - cy;

      if (!aboveHorizon) {
        if (distAbove.abs() > 5) {
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
  ) {
    final angleRad = eclipticAngleDeg * pi / 180;
    const bandHeight = 30.0;
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
          ..color = color.withValues(alpha: 0.06)
          ..style = PaintingStyle.fill,
      );
    }
  }

  void _drawAngleBetween(Canvas canvas, double cx, double cy) {
    final eqRad = equatorAngleDeg * pi / 180;
    final eclRad = eclipticAngleDeg * pi / 180;
    final diff = (eclipticAngleDeg - equatorAngleDeg).abs();

    if (diff < 2) return;

    const arcRadius = 45.0;
    final lowerAngle = min(eqRad, eclRad);
    final upperAngle = max(eqRad, eclRad);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: arcRadius),
      -upperAngle,
      upperAngle - lowerAngle,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    final midAngle = -(lowerAngle + upperAngle) / 2;
    drawCenteredText(
      canvas,
      '${diff.round()}\u00b0',
      cx + (arcRadius + 11) * cos(midAngle),
      cy + (arcRadius + 11) * sin(midAngle),
      9,
      color.withValues(alpha: 0.6),
    );
  }

  void _drawLabels(
    Canvas canvas,
    double w,
    double h,
    double horizonY,
    double risingX,
  ) {
    drawCenteredText(
      canvas,
      t.codex.diagramEast,
      risingX,
      horizonY + 14,
      11,
      color.withValues(alpha: 0.8),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramHorizon,
      w * 0.78,
      horizonY + 14,
      10,
      color.withValues(alpha: 0.5),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramEarth,
      w * 0.7,
      (horizonY + h) / 2,
      11,
      color.withValues(alpha: 0.35),
    );

    final angleRad = eclipticAngleDeg * pi / 180;
    final dx = cos(angleRad);
    final dy = -sin(angleRad);
    final labelDist = min(w * 0.3, h * 0.35);
    final perpX = -sin(angleRad);
    final perpY = -cos(angleRad);
    drawCenteredText(
      canvas,
      t.codex.diagramEcliptic,
      risingX + dx * labelDist + perpX * 12,
      horizonY + dy * labelDist + perpY * 12,
      10,
      color.withValues(alpha: 0.8),
    );

    final eqAngleRad = equatorAngleDeg * pi / 180;
    final eqDx = cos(eqAngleRad);
    final eqDy = -sin(eqAngleRad);
    final eqLabelDist = min(w * 0.5, h * 0.55);
    final eqPerpX = sin(eqAngleRad);
    final eqPerpY = cos(eqAngleRad);
    drawCenteredText(
      canvas,
      t.codex.diagramEquator,
      risingX + eqDx * eqLabelDist + eqPerpX * 12,
      horizonY + eqDy * eqLabelDist + eqPerpY * 12,
      9,
      color.withValues(alpha: 0.5),
    );

    final speedLabel = latitudeDeg <= 0.5
        ? t.codex.diagramAverageRising
        : latitudeDeg >= 89.5
        ? t.codex.diagramSlowRising
        : risingSpeed < 0.9
        ? t.codex.diagramSlowRising
        : risingSpeed > 1.1
        ? t.codex.diagramFastRising
        : t.codex.diagramAverageRising;
    drawCenteredText(
      canvas,
      speedLabel,
      w * 0.75,
      horizonY - 20,
      10,
      color.withValues(alpha: 0.5),
    );
  }

  @override
  bool shouldRepaint(covariant _SemidiurnalPainter old) =>
      latitudeDeg != old.latitudeDeg ||
      equatorAngleDeg != old.equatorAngleDeg ||
      eclipticAngleDeg != old.eclipticAngleDeg ||
      risingSpeed != old.risingSpeed ||
      color != old.color ||
      t != old.t;
}
