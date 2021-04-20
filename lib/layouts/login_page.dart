import 'package:flutter/material.dart';
import 'package:interviewtask/api/api.dart';
import 'package:interviewtask/assets/design/buttons.dart';
import 'package:interviewtask/assets/design/shapes.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/controller/app_controller.dart';
import 'package:interviewtask/logic/validator.dart';
import 'package:interviewtask/utils/dialogs.dart';
import 'package:interviewtask/utils/sizes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController(), otpController = new TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.accent,
      body: Stack(
        children: [
          Positioned(top: -100, right: -25, child: Shapes.secondaryCircle()),
          Shapes.titleBanner(
            "LOGIN",
            content(),
          )
        ],
      ),
    );
  }

  Widget content() => Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.ofWidth(4.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Sizes.ofHeight(1.5)),
              width: double.infinity,
              child: Text(
                "Phone Number",
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: Sizes.ofHeight(3.5)),
              child: TextField(
                decoration: Texts.p(),
                controller: phoneController,
                keyboardType: TextInputType.number,
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: Sizes.ofHeight(1.5)),
              width: double.infinity,
              child: Text(
                "OTP",
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: Sizes.ofHeight(8)),
              child: TextField(
                decoration: Texts.p(),
                controller: otpController,
                style: Texts.white(),
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              child: isLoading ? Buttons.disabledProgressButton() : Buttons.button("LOGIN", login),
            ),
            Container(
              height: Sizes.ofHeight(10),
            )
          ],
        ),
      );

  void login() async {
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = !isLoading;
    });
    AppController.handleLogin(this, context, phoneController.text, otpController.text);
  }

  void resetLogin() {
    Dialogs.AlertDialog(context, "Error!", "An error occured! Login failed!", Icons.error_outline_rounded);
    setState(() {
      isLoading = false;
      otpController.text = "";
    });
  }

  void phoneError() {
    Dialogs.AlertDialog(context, "Error!", "Please check your phone number and try again.", Icons.warning_amber_rounded);
    setState(() {
      isLoading = false;
      phoneController.text = "";
      otpController.text = "";
    });
  }

  void otpSent() {
    Dialogs.AlertDialog(context, "OTP Sent", "Please enter your OTP to continue", Icons.done_outline_rounded);
    setState(() {
      isLoading = false;
    });
  }
}
