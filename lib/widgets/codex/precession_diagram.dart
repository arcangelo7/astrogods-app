import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'sky_diagram_shared.dart';
import 'sphere_diagram_shared.dart';

const _precessionSymbols = [
  '\u2648',
  '\u2653',
  '\u2652',
  '\u2651',
  '\u2650',
  '\u264f',
  '\u264e',
  '\u264d',
  '\u264c',
  '\u264b',
  '\u264a',
  '\u2649',
];

int _precessionYear(double angle) {
  const anchors = [(0.0, -2160), (30.0, -60), (60.0, 2100)];
  if (angle <= 0) return anchors.first.$2;
  for (var i = 0; i < anchors.length - 1; i++) {
    final (a0, y0) = anchors[i];
    final (a1, y1) = anchors[i + 1];
    if (angle <= a1) {
      return (y0 + (angle - a0) / (a1 - a0) * (y1 - y0)).round();
    }
  }
  return 2100 + ((angle - 60) * 71.6).round();
}

double _yearToAngle(int year) {
  const anchors = [(0.0, -2160), (30.0, -60), (60.0, 2100)];
  if (year <= anchors.first.$2) return anchors.first.$1;
  for (var i = 0; i < anchors.length - 1; i++) {
    final (a0, y0) = anchors[i];
    final (a1, y1) = anchors[i + 1];
    if (year <= y1) {
      return a0 + (year - y0) / (y1 - y0) * (a1 - a0);
    }
  }
  return 60 + (year - 2100) / 71.6;
}

int _precessionSignIndex(double angle) => (angle / 30).floor() % 12;

String _precessionSignName(Translations t, int index) {
  switch (index % 12) {
    case 0:
      return t.codex.diagramAries;
    case 1:
      return t.codex.diagramPisces;
    case 2:
      return t.codex.diagramAquarius;
    case 3:
      return t.codex.diagramCapricorn;
    case 4:
      return t.codex.diagramSagittarius;
    case 5:
      return t.codex.diagramScorpio;
    case 6:
      return t.codex.diagramLibra;
    case 7:
      return t.codex.diagramVirgo;
    case 8:
      return t.codex.diagramLeo;
    case 9:
      return t.codex.diagramCancer;
    case 10:
      return t.codex.diagramGemini;
    default:
      return t.codex.diagramTaurus;
  }
}

String _formatYear(Translations t, int year, {bool suffix = true}) {
  if (year < 0) return '${-year} ${t.codex.diagramYearBCE}';
  if (year == 0) return '1 ${t.codex.diagramYearBCE}';
  if (suffix) return '$year ${t.codex.diagramYearCE}';
  return '$year';
}

class PrecessionDiagram extends StatefulWidget {
  const PrecessionDiagram({super.key});

  @override
  State<PrecessionDiagram> createState() => _PrecessionDiagramState();
}

class _PrecessionDiagramState extends State<PrecessionDiagram> {
  double _angle = _yearToAngle(DateTime.now().year).clamp(0, 360);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = Translations.of(context);

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
                    painter: _GyroscopePainter(
                      angleDeg: _angle,
                      color: color,
                      isDark: isDark,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                t.codex.diagramPrecessionAge(
                  symbol: _precessionSymbols[_precessionSignIndex(_angle)],
                  sign: _precessionSignName(t, _precessionSignIndex(_angle)),
                  year: _formatYear(t, _precessionYear(_angle)),
                ),
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
                  value: _angle,
                  max: 360,
                  divisions: 360,
                  onChanged: (v) => setState(() => _angle = v),
                ),
              ),
              _sliderLabels(sliderW, color, t),
            ],
          ),
        );
      },
    );
  }

  Widget _sliderLabels(double width, Color color, Translations t) {
    const pad = 20.0;
    final track = width - 2 * pad;
    final style = TextStyle(color: color, fontSize: 11);
    String tick(double deg) =>
        '${_precessionSymbols[_precessionSignIndex(deg)]} '
        '${_formatYear(t, _precessionYear(deg), suffix: false)}';
    final items = [
      (0.0, tick(0)),
      (90.0, tick(90)),
      (180.0, tick(180)),
      (270.0, tick(270)),
      (360.0, _precessionSymbols[0]),
    ];
    return SizedBox(
      width: width,
      height: 18,
      child: Stack(
        clipBehavior: Clip.none,
        children: items.map((c) {
          final (val, name) = c;
          return Positioned(
            left: pad + (val / 360) * track,
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

class _GyroscopePainter extends CustomPainter {
  final double angleDeg;
  final Color color;
  final bool isDark;
  final Translations t;

  const _GyroscopePainter({
    required this.angleDeg,
    required this.color,
    required this.isDark,
    required this.t,
  });

  static const _obliquity = 23.44 * pi / 180;
  static const _fy = 0.25;

  double _a(double v) => skyDiagramAlpha(isDark, v);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final s = min(size.width, size.height);
    final cx = size.width / 2;
    final earthCy = size.height * 0.58;
    final earthR = s * 0.10;
    final axisLen = s * 0.34;
    final phi = angleDeg * pi / 180;

    final circleRx = axisLen * sin(_obliquity);
    final circleRy = circleRx * _fy;
    final circleCy = earthCy - axisLen * cos(_obliquity);

    final celPoleX = cx + circleRx * cos(phi);
    final celPoleY = circleCy + circleRy * sin(phi);
    final eclPoleY = earthCy - axisLen;

    final axDx = celPoleX - cx;
    final axDy = celPoleY - earthCy;
    final axLen = sqrt(axDx * axDx + axDy * axDy);
    final lowerLen = earthR * 1.8;
    final lowerX = cx - axDx / axLen * lowerLen;
    final lowerY = earthCy - axDy / axLen * lowerLen;

    _drawVerticalLine(canvas, cx, eclPoleY, earthCy, lowerLen);
    _drawConeEdges(canvas, cx, earthCy, circleRx, circleCy);
    _drawPrecessionEllipse(canvas, cx, circleCy, circleRx, circleRy);
    _drawEarth(canvas, cx, earthCy, earthR, celPoleX, celPoleY);
    _drawAxis(canvas, celPoleX, celPoleY, lowerX, lowerY);
    _drawObliquityArc(canvas, cx, earthCy, celPoleX, celPoleY, earthR);
    _drawCelestialPoleMarker(canvas, celPoleX, celPoleY);
    _drawLabels(canvas, cx, earthCy, earthR, celPoleX, celPoleY, circleCy);
  }

  void _drawVerticalLine(
    Canvas canvas,
    double cx,
    double eclPoleY,
    double earthCy,
    double lowerLen,
  ) {
    drawDashedLine(
      canvas,
      Offset(cx, eclPoleY - 12),
      Offset(cx, earthCy + lowerLen),
      Paint()
        ..color = color.withValues(alpha: _a(0.15))
        ..strokeWidth = 1,
    );
  }

  void _drawConeEdges(
    Canvas canvas,
    double cx,
    double earthCy,
    double circleRx,
    double circleCy,
  ) {
    final paint = Paint()
      ..color = color.withValues(alpha: _a(0.10))
      ..strokeWidth = 0.8;
    canvas.drawLine(
      Offset(cx, earthCy),
      Offset(cx - circleRx, circleCy),
      paint,
    );
    canvas.drawLine(
      Offset(cx, earthCy),
      Offset(cx + circleRx, circleCy),
      paint,
    );
  }

  void _drawPrecessionEllipse(
    Canvas canvas,
    double cx,
    double cy,
    double rx,
    double ry,
  ) {
    final path = sampleCircularPath(
      steps: 80,
      sample: (angle) => Offset(cx + rx * cos(angle), cy + ry * sin(angle)),
    );
    drawDashedPath(
      canvas,
      path,
      Paint()
        ..color = color.withValues(alpha: _a(0.3))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  void _drawEarth(
    Canvas canvas,
    double cx,
    double cy,
    double r,
    double celPoleX,
    double celPoleY,
  ) {
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()..color = color.withValues(alpha: _a(0.04)),
    );
    drawSphereOutline(
      canvas: canvas,
      center: Offset(cx, cy),
      radius: r,
      color: color,
      alpha: _a(0.3),
    );

    final axisAngle = atan2(celPoleY - cy, celPoleX - cx);
    final eqAngle = axisAngle + pi / 2;
    final eqLen = r * 0.9;
    canvas.drawLine(
      Offset(cx + eqLen * cos(eqAngle), cy + eqLen * sin(eqAngle)),
      Offset(cx - eqLen * cos(eqAngle), cy - eqLen * sin(eqAngle)),
      Paint()
        ..color = color.withValues(alpha: _a(0.25))
        ..strokeWidth = 1,
    );
  }

  void _drawAxis(
    Canvas canvas,
    double celPoleX,
    double celPoleY,
    double lowerX,
    double lowerY,
  ) {
    canvas.drawLine(
      Offset(celPoleX, celPoleY),
      Offset(lowerX, lowerY),
      Paint()
        ..color = color.withValues(alpha: _a(0.7))
        ..strokeWidth = 1.8,
    );
  }

  void _drawObliquityArc(
    Canvas canvas,
    double cx,
    double earthCy,
    double celPoleX,
    double celPoleY,
    double earthR,
  ) {
    final dx = celPoleX - cx;
    if (dx.abs() < earthR * 0.4) return;

    final axisAngle = atan2(celPoleY - earthCy, celPoleX - cx);
    const verticalAngle = -pi / 2;
    var sweep = axisAngle - verticalAngle;
    if (sweep > pi) sweep -= 2 * pi;
    if (sweep < -pi) sweep += 2 * pi;

    final arcR = earthR * 2.2;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, earthCy), radius: arcR),
      verticalAngle,
      sweep,
      false,
      Paint()
        ..color = color.withValues(alpha: _a(0.25))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  void _drawCelestialPoleMarker(Canvas canvas, double x, double y) {
    if (isDark) {
      canvas.drawCircle(
        Offset(x, y),
        10,
        Paint()..color = const Color(0x22FFA726),
      );
      canvas.drawCircle(
        Offset(x, y),
        6,
        Paint()..color = const Color(0x44FFA726),
      );
    }
    canvas.drawCircle(
      Offset(x, y),
      4,
      Paint()
        ..color = isDark ? const Color(0xFFFFD54F) : const Color(0xFFFF8F00),
    );
  }

  void _drawLabels(
    Canvas canvas,
    double cx,
    double earthCy,
    double earthR,
    double celPoleX,
    double celPoleY,
    double circleCy,
  ) {
    final lc = color.withValues(alpha: _a(0.7));

    final dx = celPoleX - cx;
    final dy = celPoleY - circleCy;
    final dist = max(1.0, sqrt(dx * dx + dy * dy));
    final ux = dx / dist;
    final uy = dy / dist;
    final offset = dist < 15 ? 35.0 : 22.0;
    drawCenteredText(
      canvas,
      t.codex.diagramCelestialPole,
      celPoleX + ux * offset,
      celPoleY + uy * offset,
      11,
      lc,
    );

    drawCenteredText(
      canvas,
      t.codex.diagramEarth,
      cx,
      earthCy + earthR + 14,
      12,
      lc,
    );
  }

  @override
  bool shouldRepaint(covariant _GyroscopePainter old) =>
      angleDeg != old.angleDeg ||
      color != old.color ||
      isDark != old.isDark ||
      t != old.t;
}
