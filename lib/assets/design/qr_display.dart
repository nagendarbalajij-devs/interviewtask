import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/clipper.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/logic/qr_generator.dart';
import 'package:interviewtask/utils/sizes.dart';

class QrDisplay {
  static Widget currentQr(String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.ofHeight(4)),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(Sizes.ofWidth(10), Sizes.ofHeight(20), Sizes.ofWidth(10), Sizes.ofHeight(2)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
//                    width: width,
                    height: Sizes.ofWidth(40),
                    color: Colours.qrBackground,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      height: Sizes.ofWidth(40),
                      color: Colours.accent,
                    ),
                  ),
                ),
                Container(
                  height: Sizes.ofWidth(40),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: Sizes.ofHeight(1)),
                        child: Text(
                          "Generated number",
                          style: Texts.white(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: Sizes.ofHeight(2)),
                        child: value == ""
                            ? SizedBox(
                                height: Sizes.ofWidth(6),
                                width: Sizes.ofWidth(6),
                                child: CircularProgressIndicator(),
                              )
                            : Text(
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
              padding: EdgeInsets.all(Sizes.ofWidth(3)),
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
      height: Sizes.ofWidth(36),
      margin: EdgeInsets.symmetric(horizontal: Sizes.ofWidth(10)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colours.qrBackground, borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(top: Sizes.ofHeight(3.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Sizes.ofWidth(25),
                  width: Sizes.ofWidth(25),
                ),
                Container(
                  width: w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: Sizes.ofHeight(2), bottom: Sizes.ofHeight(2)),
                        child: Text(
                          "Previous number",
                          style: Texts.white(),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.ofWidth(2)),
                        //margin: EdgeInsets.only(bottom: Sizes.ofHeight(2)),
                        child: value == ""
                            ? SizedBox(height: Sizes.ofWidth(3), width: Sizes.ofWidth(3), child: CircularProgressIndicator())
                            : Text(
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
                padding: EdgeInsets.all(Sizes.ofWidth(0.5)),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: QrGenerator.generateOldImage(value),
              )),
        ],
      ),
    );
  }
}
