import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'sky_diagram_shared.dart';
import 'sphere_diagram_shared.dart';

class EquatorEclipticDiagram extends StatefulWidget {
  const EquatorEclipticDiagram({super.key});

  @override
  State<EquatorEclipticDiagram> createState() => _EquatorEclipticDiagramState();
}

class _EquatorEclipticDiagramState extends State<EquatorEclipticDiagram> {
  double _longitude = 0;

  String _seasonName(Translations t) {
    if (_longitude < 90) return t.codex.diagramSpring;
    if (_longitude < 180) return t.codex.diagramSummer;
    if (_longitude < 270) return t.codex.diagramAutumn;
    return t.codex.diagramWinter;
  }

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
                    painter: _SunJourneyPainter(
                      longitudeDeg: _longitude,
                      color: color,
                      isDark: isDark,
                      t: t,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _seasonName(t),
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
              _sliderLabels(sliderW, color),
            ],
          ),
        );
      },
    );
  }

  Widget _sliderLabels(double width, Color color) {
    const pad = 20.0;
    final track = width - 2 * pad;
    final style = TextStyle(color: color, fontSize: 11);
    final items = [
      (0.0, '0°'),
      (90.0, '90°'),
      (180.0, '180°'),
      (270.0, '270°'),
      (360.0, '360°'),
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

class _SunJourneyPainter extends CustomPainter {
  final double longitudeDeg;
  final Color color;
  final bool isDark;
  final Translations t;

  const _SunJourneyPainter({
    required this.longitudeDeg,
    required this.color,
    required this.isDark,
    required this.t,
  });

  static const _fy = 0.2;
  static final _tilt = sin(23.44 * pi / 180);

  double _a(double v) => skyDiagramAlpha(isDark, v);

  Offset _eqPt(double a, double cx, double cy, double r) =>
      Offset(cx + r * cos(a), cy + r * _fy * sin(a));

  Offset _eclPt(double a, double cx, double cy, double r) =>
      Offset(cx + r * cos(a), cy + r * _fy * sin(a) - r * _tilt * cos(a));

  double _lonToAngle(double lonDeg) => 3 * pi / 2 + lonDeg * pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    final s = min(size.width, size.height);
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = s * 0.36;

    _drawSphere(canvas, cx, cy, r);
    _drawEquator(canvas, cx, cy, r);
    _drawEcliptic(canvas, cx, cy, r);
    _drawCardinalDots(canvas, cx, cy, r);
    _drawLabels(canvas, cx, cy, r);
    _drawSun(canvas, cx, cy, r);
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

  void _drawEquator(Canvas canvas, double cx, double cy, double r) {
    final path = sampleCircularPath(
      steps: 80,
      sample: (angle) => _eqPt(angle, cx, cy, r),
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
    final path = sampleCircularPath(
      steps: 80,
      sample: (angle) => _eclPt(angle, cx, cy, r),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withValues(alpha: _a(0.8))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  void _drawCardinalDots(Canvas canvas, double cx, double cy, double r) {
    final paint = Paint()..color = color.withValues(alpha: _a(0.7));
    // Vernal equinox (a=3pi/2, upper crossing)
    canvas.drawCircle(_eqPt(3 * pi / 2, cx, cy, r), 3, paint);
    // Summer solstice (a=0, right side, ecliptic above equator)
    canvas.drawCircle(_eclPt(0, cx, cy, r), 3, paint);
    // Autumnal equinox (a=pi/2, lower crossing)
    canvas.drawCircle(_eqPt(pi / 2, cx, cy, r), 3, paint);
    // Winter solstice (a=pi, left side, ecliptic below equator)
    canvas.drawCircle(_eclPt(pi, cx, cy, r), 3, paint);
  }

  void _drawSun(Canvas canvas, double cx, double cy, double r) {
    final a = _lonToAngle(longitudeDeg);
    final pos = _eclPt(a, cx, cy, r);

    if (isDark) {
      canvas.drawCircle(pos, 12, Paint()..color = const Color(0x22FFA726));
      canvas.drawCircle(pos, 8, Paint()..color = const Color(0x44FFA726));
    }
    canvas.drawCircle(
      pos,
      5,
      Paint()
        ..color = isDark ? const Color(0xFFFFD54F) : const Color(0xFFFF8F00),
    );
  }

  void _drawLabels(Canvas canvas, double cx, double cy, double r) {
    final lc = color.withValues(alpha: _a(0.7));

    // Vernal equinox (upper crossing)
    final ve = _eqPt(3 * pi / 2, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramVernalEquinox,
      ve.dx,
      ve.dy - 18,
      11,
      lc,
    );

    // Summer solstice (right, above equator)
    final ss = _eclPt(0, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramSummerSolstice,
      ss.dx - 5,
      ss.dy - 18,
      11,
      lc,
    );

    // Autumnal equinox (lower crossing)
    final ae = _eqPt(pi / 2, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramAutumnalEquinox,
      ae.dx,
      ae.dy + 18,
      11,
      lc,
    );

    // Winter solstice (left, below equator)
    final ws = _eclPt(pi, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramWinterSolstice,
      ws.dx + 5,
      ws.dy + 18,
      11,
      lc,
    );

    // Ecliptic label (upper-left, below the ecliptic curve at a=5pi/4)
    final eclPt = _eclPt(5 * pi / 4, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramEcliptic,
      eclPt.dx,
      eclPt.dy + 14,
      11,
      color.withValues(alpha: _a(0.8)),
    );

    // Equator label (lower-right, below the equator curve at a=pi/4)
    final eqPt = _eqPt(pi / 4, cx, cy, r);
    drawCenteredText(
      canvas,
      t.codex.diagramCelestialEquatorShort,
      eqPt.dx,
      eqPt.dy + 14,
      11,
      color.withValues(alpha: _a(0.5)),
    );
  }

  @override
  bool shouldRepaint(covariant _SunJourneyPainter old) =>
      longitudeDeg != old.longitudeDeg ||
      color != old.color ||
      isDark != old.isDark ||
      t != old.t;
}
