import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/utils/sizes.dart';

class Dialogs {
  static Widget AlertDialog(context, String title, String message, var icon) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          width: Sizes.width,
          //padding: EdgeInsets.symmetric(horizontal: 25),
          child: Dialog(
            backgroundColor: Colours.secondary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: EdgeInsets.only(top: Sizes.ofHeight(1.5)),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        icon,
                        color: Colours.accent,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: Sizes.ofHeight(1)),
                  child: Center(
                    child: Text(
                      title,
                      style: Texts.white(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Sizes.ofHeight(1), bottom: Sizes.ofHeight(1.5)),
                  padding: EdgeInsets.symmetric(horizontal: Sizes.ofWidth(4)),
                  child: Center(
                    child: Text(
                      message,
                      style: Texts.whiteSubText(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                  color: Colours.accent,
                  child: InkWell(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: Sizes.ofHeight(1.2)),
                      child: Text(
                        "OK",
                        style: Texts.white(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
