import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import '../../utils/ecliptic_horizon_geometry.dart';
import 'sky_diagram_shared.dart';
import 'sphere_diagram_shared.dart';

class EclipticHorizonDiagram extends StatefulWidget {
  const EclipticHorizonDiagram({super.key});

  @override
  State<EclipticHorizonDiagram> createState() => _EclipticHorizonDiagramState();
}

class _EclipticHorizonDiagramState extends State<EclipticHorizonDiagram> {
  static const _romeLatitude = 42.0;

  double _longitude = 0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = Translations.of(context);
    final geometry = eclipticHorizonForLongitude(
      latitudeDeg: _romeLatitude,
      longitudeDeg: _longitude,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartSize = min(380.0, w - 32);
        final sliderW = min(400.0, w - 32);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  width: chartSize,
                  height: chartSize,
                  child: CustomPaint(
                    painter: _HorizonSpherePainter(
                      latitudeDeg: _romeLatitude,
                      eclipticAngleDeg: geometry.horizonAngleDeg,
                      color: color,
                      isDark: isDark,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _statusLabel(geometry, t),
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _longitude,
                  max: 360,
                  divisions: 360,
                  onChanged: (v) => setState(() => _longitude = v),
                ),
              ),
              _signLabels(sliderW, color),
              const SizedBox(height: 16),
              Text(
                t.codex.diagramRomeLatitude,
                style: TextStyle(color: color, fontSize: 13),
              ),
            ],
          ),
        );
      },
    );
  }

  String _statusLabel(EclipticLongitudeSnapshot geometry, Translations t) {
    final ascensionType = geometry.ascendantSpeed <= 1
        ? t.codex.diagramLongAscension
        : t.codex.diagramShortAscension;
    return '${geometry.horizonAngleDeg.round()}\u00b0 \u00b7 $ascensionType';
  }

  Widget _signLabels(double width, Color color) {
    const pad = 20.0;
    final track = width - 2 * pad;
    final style = TextStyle(color: color, fontSize: 13);
    const signs = [
      '\u2648',
      '\u2649',
      '\u264A',
      '\u264B',
      '\u264C',
      '\u264D',
      '\u264E',
      '\u264F',
      '\u2650',
      '\u2651',
      '\u2652',
      '\u2653',
    ];
    return SizedBox(
      width: width,
      height: 22,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(12, (i) {
          final mid = i * 30.0 + 15.0;
          return Positioned(
            left: pad + (mid / 360) * track,
            top: 0,
            child: FractionalTranslation(
              translation: const Offset(-0.5, 0),
              child: Text(signs[i], style: style),
            ),
          );
        }),
      ),
    );
  }
}

class _HorizonSpherePainter extends CustomPainter {
  final double latitudeDeg;
  final double eclipticAngleDeg;
  final Color color;
  final bool isDark;
  final Translations t;

  const _HorizonSpherePainter({
    required this.latitudeDeg,
    required this.eclipticAngleDeg,
    required this.color,
    required this.isDark,
    required this.t,
  });

  static const _flattening = 0.2;
  static const _arcControlFactor = 0.52;

  double _a(double v) => skyDiagramAlpha(isDark, v);

  Offset _horizonPoint(double angle, double cx, double cy, double r) {
    return Offset(cx + r * cos(angle), cy + r * _flattening * sin(angle));
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final s = min(size.width, size.height);
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = s * 0.36;

    _drawSphere(canvas, cx, cy, r);
    _drawHorizon(canvas, cx, cy, r);
    _drawEcliptic(canvas, cx, cy, r);
    _drawCelestialPole(canvas, cx, cy, r);
    _drawRisingDot(canvas, cx, cy, r);
    _drawLabels(canvas, cx, cy, r);
  }

  void _drawSphere(Canvas canvas, double cx, double cy, double r) {
    drawSphereOutline(
      canvas: canvas,
      center: Offset(cx, cy),
      radius: r,
      color: color,
      alpha: _a(0.12),
    );
  }

  void _drawHorizon(Canvas canvas, double cx, double cy, double r) {
    final path = sampleCircularPath(
      steps: 160,
      sample: (angle) => _horizonPoint(angle, cx, cy, r),
    );
    drawDashedPath(
      canvas,
      path,
      Paint()
        ..color = color.withValues(alpha: _a(0.5))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  void _drawEcliptic(Canvas canvas, double cx, double cy, double r) {
    final upperArc = _eclipticArcPath(cx: cx, cy: cy, r: r, upper: true);
    final lowerArc = _eclipticArcPath(cx: cx, cy: cy, r: r, upper: false);
    final brightPaint = Paint()
      ..color = color.withValues(alpha: _a(0.82))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final dimPaint = Paint()
      ..color = color.withValues(alpha: _a(0.45))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawPath(upperArc, brightPaint);
    drawDashedPath(canvas, lowerArc, dimPaint);
  }

  void _drawCelestialPole(Canvas canvas, double cx, double cy, double r) {
    final latitudeRad = latitudeDeg * pi / 180;
    final poleY = cy - r * (_flattening + (1 - _flattening) * sin(latitudeRad));
    final zenithY = cy - r * _flattening;

    canvas.drawCircle(
      Offset(cx, poleY),
      4,
      Paint()..color = color.withValues(alpha: _a(0.8)),
    );

    drawDashedLine(
      canvas,
      Offset(cx, zenithY),
      Offset(cx, poleY),
      Paint()
        ..color = color.withValues(alpha: _a(0.25))
        ..strokeWidth = 1.0,
    );
  }

  void _drawRisingDot(Canvas canvas, double cx, double cy, double r) {
    final eastPoint = Offset(cx + r, cy);
    final westPoint = Offset(cx - r, cy);
    final dotPaint = Paint()..color = color.withValues(alpha: _a(0.7));

    if (isDark) {
      canvas.drawCircle(
        eastPoint,
        10,
        Paint()..color = color.withValues(alpha: 0.08),
      );
    }

    canvas.drawCircle(eastPoint, 4, dotPaint);
    canvas.drawCircle(westPoint, 3, dotPaint);
  }

  void _drawLabels(Canvas canvas, double cx, double cy, double r) {
    final labelColor = color.withValues(alpha: _a(0.7));
    final horizon = _horizonPoint(pi / 4, cx, cy, r);
    final ecliptic = Offset(
      cx - r * 0.55,
      cy - r * max(0.08, sin(eclipticAngleDeg * pi / 180) * 0.48),
    );
    final latitudeRad = latitudeDeg * pi / 180;
    final poleY = cy - r * (_flattening + (1 - _flattening) * sin(latitudeRad));

    drawCenteredText(
      canvas,
      t.codex.diagramEast,
      cx + r,
      cy + 18,
      13,
      labelColor,
    );
    drawCenteredText(
      canvas,
      t.codex.diagramWest,
      cx - r,
      cy + 18,
      13,
      labelColor,
    );
    drawCenteredText(
      canvas,
      t.codex.diagramHorizon,
      horizon.dx + 12,
      horizon.dy + 14,
      11,
      color.withValues(alpha: _a(0.5)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramEcliptic,
      ecliptic.dx,
      ecliptic.dy - 14,
      11,
      color.withValues(alpha: _a(0.8)),
    );
    drawCenteredText(
      canvas,
      t.codex.diagramCelestialPole,
      cx,
      poleY - 14,
      12,
      color.withValues(alpha: _a(0.7)),
    );
  }

  Path _eclipticArcPath({
    required double cx,
    required double cy,
    required double r,
    required bool upper,
  }) {
    final angleRad = eclipticAngleDeg * pi / 180;
    final controlLength = r * _arcControlFactor;
    final dx = controlLength * cos(angleRad);
    final dy = controlLength * sin(angleRad);
    final west = Offset(cx - r, cy);
    final east = Offset(cx + r, cy);
    final sign = upper ? -1.0 : 1.0;

    return Path()
      ..moveTo(west.dx, west.dy)
      ..cubicTo(
        west.dx + dx,
        west.dy + sign * dy,
        east.dx - dx,
        east.dy + sign * dy,
        east.dx,
        east.dy,
      );
  }

  @override
  bool shouldRepaint(covariant _HorizonSpherePainter old) =>
      latitudeDeg != old.latitudeDeg ||
      eclipticAngleDeg != old.eclipticAngleDeg ||
      color != old.color ||
      isDark != old.isDark ||
      t != old.t;
}
