import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interviewtask/api/api.dart';
import 'package:interviewtask/assets/design/buttons.dart';
import 'package:interviewtask/assets/design/qr_display.dart';
import 'package:interviewtask/assets/design/shapes.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/logic/generator.dart';
import 'package:interviewtask/logic/qr_generator.dart';
import 'package:interviewtask/utils/dialogs.dart';
import 'package:interviewtask/utils/sizes.dart';

class PluginPage extends StatefulWidget {
  @override
  _PluginPageState createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  String randomValue = "", oldValue = "";
  bool showOld = false, isLoading = false;
  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
    setState(() {
      randomValue = "";
      oldValue = "";
    });
    randomValue = await Generator.getRandom();
    print(randomValue);
    oldValue = await Api.getPrevious();
    print(oldValue);
    if (oldValue != null) {
      showOld = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.accent,
      body: Stack(
        children: [
          Positioned(top: -100, right: -25, child: Shapes.secondaryCircle()),
          Shapes.titleBanner(
            "PLUGIN",
            content(),
          ),
          Positioned(
            bottom: 25,
            right: 35,
            left: 35,
            child: isLoading ? Buttons.disabledProgressButton() : Buttons.button("Save", save),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: Sizes.topPadding),
              child: TextButton(
                child: Text(
                  "LOGOUT",
                  style: Texts.white(),
                ),
                onPressed: logout,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget content() => Container(
        child: Column(
          children: [
            Container(
              child: QrDisplay.currentQr("$randomValue"),
            ),
            showOld
                ? Container(
                    child: QrDisplay.oldQr("$oldValue", MediaQuery.of(context).size.width),
                  )
                : Container()
          ],
        ),
      );

  save() async {
    setState(() {
      isLoading = !isLoading;
    });
    await Api.saveValue(randomValue);
    setState(() {
      isLoading = !isLoading;
    });
    Dialogs.AlertDialog(context, "Success", "Number saved in database. New one generated", Icons.done_outline_rounded);
    getValues();
  }

  logout() async {
    await Api.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
