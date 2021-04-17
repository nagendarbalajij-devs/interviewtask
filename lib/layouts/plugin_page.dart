import 'package:flutter/material.dart';
import 'package:interviewtask/api/api.dart';
import 'package:interviewtask/assets/design/buttons.dart';
import 'package:interviewtask/assets/design/qr_display.dart';
import 'package:interviewtask/assets/design/shapes.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/logic/generator.dart';
import 'package:interviewtask/logic/qr_generator.dart';

class PluginPage extends StatefulWidget {
  @override
  _PluginPageState createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  String randomValue = " ", oldValue = "XXXXX";
  bool showOld = false;
  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
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
    var topPadding = MediaQuery.of(context).padding.top;
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
            child: Buttons.button("Save", save),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: topPadding),
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
                    child: QrDisplay.oldQr("$oldValue"),
                  )
                : Container()
          ],
        ),
      );

  save() async {
    await Api.saveValue(randomValue);
    getValues();
  }

  logout() async {
    await Api.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
