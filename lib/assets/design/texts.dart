import 'package:flutter/material.dart';
import 'package:interviewtask/assets/themes/colours.dart';

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
    return TextStyle(color: Colors.white, fontSize: 22);
  }

  static whiteBig() {
    return TextStyle(color: Colors.white, fontSize: 28);
  }
}
