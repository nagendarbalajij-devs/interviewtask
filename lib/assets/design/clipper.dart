import 'dart:developer';

import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    log("${size.width} ${size.height}");
    var width = 500.0;
    var height = 200.0;
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
