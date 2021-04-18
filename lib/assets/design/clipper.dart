import 'dart:developer';

import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width, h = size.height;
    log("Clipper $w $h");
    var path = Path()
      ..lineTo(0, 20)
      ..lineTo(w - 20, h)
      ..lineTo(w, h)
      ..lineTo(w, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
