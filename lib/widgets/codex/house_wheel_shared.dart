import 'dart:math';

import 'package:material_ui/material_ui.dart';

import 'sky_diagram_shared.dart';

const houseRomanNumerals = [
  'I',
  'II',
  'III',
  'IV',
  'V',
  'VI',
  'VII',
  'VIII',
  'IX',
  'X',
  'XI',
  'XII',
];

const equalHouses = [
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
  30.0,
];

void paintWheelCircles(
  Canvas canvas,
  Offset center,
  List<double> radii,
  Color color,
) {
  final paint = Paint()
    ..color = color.withValues(alpha: 0.3)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;
  for (final r in radii) {
    canvas.drawCircle(center, r, paint);
  }
}

void paintWheelDivisions({
  required Canvas canvas,
  required Offset center,
  required double innerR,
  required double outerR,
  required List<double> houses,
  required Color color,
  bool highlightAxes = true,
}) {
  final axisPaint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.5;
  final cuspPaint = Paint()
    ..color = color.withValues(alpha: 0.5)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.8;

  double angle = pi;
  for (int i = 0; i < 12; i++) {
    final isAxis = highlightAxes && i % 3 == 0;
    final ca = cos(angle);
    final sa = sin(angle);
    canvas.drawLine(
      Offset(center.dx + innerR * ca, center.dy + innerR * sa),
      Offset(center.dx + outerR * ca, center.dy + outerR * sa),
      isAxis ? axisPaint : cuspPaint,
    );
    angle -= houses[i] * pi / 180;
  }
}

void paintHouseLabels({
  required Canvas canvas,
  required Offset center,
  required double innerR,
  required double outerR,
  required List<double> houses,
  required Color color,
  required double fontSize,
}) {
  double angle = pi;
  for (int i = 0; i < 12; i++) {
    final sweep = houses[i] * pi / 180;
    final mid = angle - sweep / 2;
    final lr = (outerR + innerR) / 2;

    if (houses[i] >= 5) {
      drawCenteredText(
        canvas,
        houseRomanNumerals[i],
        center.dx + lr * cos(mid),
        center.dy + lr * sin(mid),
        fontSize,
        color.withValues(alpha: 0.7),
      );
    }
    angle -= sweep;
  }
}
