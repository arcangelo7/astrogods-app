import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'house_wheel_shared.dart';
import 'sky_diagram_shared.dart';

class PlacidoDiagram extends StatefulWidget {
  const PlacidoDiagram({super.key});

  @override
  State<PlacidoDiagram> createState() => _PlacidoDiagramState();
}

class _PlacidoDiagramState extends State<PlacidoDiagram> {
  double _latitude = 0.0;

  static const _obliquity = 23.44 * pi / 180;
  static const _offsets = [26.67, -6.67, -20.0];

  static List<double> _computeHouses(double latDeg) {
    if (latDeg <= 0) return List.filled(12, 30.0);
    final d = tan(latDeg * pi / 180) * tan(_obliquity);
    final raw = List.generate(12, (i) => max(0.0, 30.0 + d * _offsets[i % 3]));
    final sum = raw.fold(0.0, (a, b) => a + b);
    if (sum <= 0) return List.filled(12, 30.0);
    final scale = 360.0 / sum;
    return raw.map((h) => h * scale).toList();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final t = Translations.of(context);
    final houses = _computeHouses(_latitude);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartSize = min(280.0, w - 32);
        final sliderW = min(400.0, w - 32);
        final narrow = w < 400;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: chartSize,
                height: chartSize,
                child: CustomPaint(
                  painter: _WheelPainter(houses: houses, color: color),
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
                fontSize: 9,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<double> houses;
  final Color color;

  const _WheelPainter({required this.houses, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerR = size.width / 2 - 2;
    final innerR = outerR * 0.4;

    paintWheelCircles(canvas, center, [outerR, innerR], color);
    paintWheelDivisions(
      canvas: canvas,
      center: center,
      innerR: innerR,
      outerR: outerR,
      houses: houses,
      color: color,
    );
    paintHouseLabels(
      canvas: canvas,
      center: center,
      innerR: innerR,
      outerR: outerR,
      houses: houses,
      color: color,
      fontSize: outerR * 0.11,
    );
  }

  @override
  bool shouldRepaint(covariant _WheelPainter old) {
    for (int i = 0; i < 12; i++) {
      if (houses[i] != old.houses[i]) return true;
    }
    return false;
  }
}
