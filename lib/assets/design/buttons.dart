import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';

class Buttons {
  static Widget button(String title, dynamic callback) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Colours.alternate,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: callback,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                "$title",
                style: Texts.white(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
