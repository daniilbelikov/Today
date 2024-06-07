import 'dart:math';
import 'package:today/helpers/constants.dart';
import 'package:flutter/material.dart';

class EmptyLinearCircle extends CustomPainter {
  EmptyLinearCircle({required this.width});

  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          TodayColors.green,
          TodayColors.purple,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0,
      2 * pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
