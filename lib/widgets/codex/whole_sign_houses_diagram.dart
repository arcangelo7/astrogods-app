import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../i18n/translations.g.dart';
import 'house_wheel_shared.dart';
import 'sky_diagram_shared.dart';

class WholeSignHousesDiagram extends StatefulWidget {
  const WholeSignHousesDiagram({super.key});

  @override
  State<WholeSignHousesDiagram> createState() => _WholeSignHousesDiagramState();
}

class _WholeSignHousesDiagramState extends State<WholeSignHousesDiagram> {
  int _ascendingSign = 0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final t = Translations.of(context);
    final names = [
      t.codex.diagramAries,
      t.codex.diagramTaurus,
      t.codex.diagramGemini,
      t.codex.diagramCancer,
      t.codex.diagramLeo,
      t.codex.diagramVirgo,
      t.codex.diagramLibra,
      t.codex.diagramScorpio,
      t.codex.diagramSagittarius,
      t.codex.diagramCapricorn,
      t.codex.diagramAquarius,
      t.codex.diagramPisces,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final chartSize = min(300.0, w - 32);
        final sliderW = min(400.0, w - 32);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: chartSize,
                height: chartSize,
                child: CustomPaint(
                  painter: _WholeSignWheelPainter(
                    ascendingSign: _ascendingSign,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t.codex.diagramAscendingSign(sign: names[_ascendingSign]),
                style: TextStyle(color: color, fontSize: 14),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: sliderW,
                child: Slider(
                  value: _ascendingSign.toDouble(),
                  max: 11,
                  divisions: 11,
                  onChanged: (v) => setState(() => _ascendingSign = v.round()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WholeSignWheelPainter extends CustomPainter {
  final int ascendingSign;
  final Color color;

  const _WholeSignWheelPainter({
    required this.ascendingSign,
    required this.color,
  });

  static const _glyphs = [
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

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerR = size.width / 2 - 2;
    final middleR = outerR * 0.72;
    final innerR = outerR * 0.4;

    paintWheelCircles(canvas, center, [outerR, middleR, innerR], color);
    paintWheelDivisions(
      canvas: canvas,
      center: center,
      innerR: innerR,
      outerR: outerR,
      houses: equalHouses,
      color: color,
    );
    paintHouseLabels(
      canvas: canvas,
      center: center,
      innerR: innerR,
      outerR: middleR,
      houses: equalHouses,
      color: color,
      fontSize: outerR * 0.10,
    );

    const sweep = 30.0 * pi / 180;
    double angle = pi;
    for (int i = 0; i < 12; i++) {
      final signIdx = (ascendingSign + i) % 12;
      final mid = angle - sweep / 2;
      final lr = (outerR + middleR) / 2;
      drawCenteredText(
        canvas,
        _glyphs[signIdx],
        center.dx + lr * cos(mid),
        center.dy + lr * sin(mid),
        outerR * 0.12,
        color,
      );
      angle -= sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _WholeSignWheelPainter old) =>
      ascendingSign != old.ascendingSign;
}
