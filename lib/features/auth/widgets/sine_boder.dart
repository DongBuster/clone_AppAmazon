import 'dart:math';

import 'package:flutter/material.dart';

class TopSineBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double yTop = 0;
    final xMax = size.width;
    final xInc = 1;
    final amplitude = 10;
    final frequency = 5;

    path.moveTo(0, yTop);

    for (double x = 0; x <= xMax; x += xInc) {
      final y = yTop + amplitude * sin(2 * pi * frequency * x / xMax);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(TopSineBorderClipper oldClipper) => false;
}
