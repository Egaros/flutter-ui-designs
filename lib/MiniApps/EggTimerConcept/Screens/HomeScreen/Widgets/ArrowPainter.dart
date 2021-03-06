import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class ArrowPainter extends CustomPainter {
  ArrowPainter({this.rotationPercent})
      : arrowSize = AppDimensions.ratio * 10,
        arrowPaint = Paint() {
    arrowPaint.color = Colors.black;
    arrowPaint.style = PaintingStyle.fill;
  }

  final double rotationPercent;

  final Paint arrowPaint;
  final double arrowSize;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    canvas.translate(radius, radius);
    canvas.rotate(math.pi * 2 * rotationPercent);

    final path = new Path();

    path.moveTo(0.0, -radius - arrowSize);
    path.lineTo(arrowSize, -radius + arrowSize * 0.5);
    path.lineTo(-arrowSize, -radius + arrowSize * 0.5);
    path.close();

    canvas.drawPath(path, arrowPaint);
    canvas.drawShadow(path, Colors.black, 3.0, false);
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ArrowPainter oldDelegate) => true;
}
