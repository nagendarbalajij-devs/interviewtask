import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';

class Shapes {
  static Widget secondaryCircle() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colours.secondary),
    );
  }

  static Widget titleBanner(String title, Widget body) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Colours.background),
            padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
            margin: EdgeInsets.only(top: 100),
            child: body,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 75),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$title",
                      style: Texts.white(),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
