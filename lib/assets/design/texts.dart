import 'package:flutter/material.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/utils/sizes.dart';

class Texts {
  static InputDecoration p() {
    return InputDecoration(
      fillColor: Colours.accent,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
    );
  }

  static white() {
    return TextStyle(color: Colors.white, fontSize: Sizes.fontSize);
  }

  static whiteBig() {
    return TextStyle(color: Colors.white, fontSize: Sizes.fontSize * 1.7);
  }

  static whiteSubText() {
    return TextStyle(color: Colors.white, fontSize: Sizes.fontSize * 0.7);
  }
}
