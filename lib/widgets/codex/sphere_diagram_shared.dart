import 'dart:math';

import 'package:material_ui/material_ui.dart';

void drawSphereOutline({
  required Canvas canvas,
  required Offset center,
  required double radius,
  required Color color,
  required double alpha,
}) {
  canvas.drawCircle(
    center,
    radius,
    Paint()
      ..color = color.withValues(alpha: alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0,
  );
}

Path sampleCircularPath({
  required int steps,
  required Offset Function(double angle) sample,
}) {
  final path = Path();

  for (var i = 0; i <= steps; i++) {
    final angle = 2 * pi * i / steps;
    final point = sample(angle);

    if (i == 0) {
      path.moveTo(point.dx, point.dy);
    } else {
      path.lineTo(point.dx, point.dy);
    }
  }

  return path;
}

void drawDashedPath(
  Canvas canvas,
  Path path,
  Paint paint, {
  double dashLen = 5,
  double gapLen = 4,
}) {
  for (final metric in path.computeMetrics()) {
    var distance = 0.0;

    while (distance < metric.length) {
      final end = min(distance + dashLen, metric.length);
      canvas.drawPath(metric.extractPath(distance, end), paint);
      distance += dashLen + gapLen;
    }
  }
}
