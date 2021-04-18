import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/clipper.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/logic/qr_generator.dart';

class QrDisplay {
  static Widget currentQr(String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(35, 165, 35, 25),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
//                    width: width,
                    height: 200,
                    color: Colours.qrBackground,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      height: 200,
                      color: Colours.accent,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Generated number",
                          style: Texts.white(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "$value",
                          overflow: TextOverflow.ellipsis,
                          style: Texts.whiteBig(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: QrGenerator.generateImage(value),
            ),
          ),
        ],
      ),
    );
  }

  static Widget oldQr(String value, width) {
    double w = width - (70 + 140);
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colours.qrBackground, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 120,
                ),
                Container(
                  width: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Previous number",
                          style: Texts.white(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "$value",
                          style: Texts.whiteBig(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: QrGenerator.generateOldImage(value),
              )),
        ],
      ),
    );
  }
}
