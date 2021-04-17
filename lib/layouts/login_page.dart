import 'package:flutter/material.dart';
import 'package:interviewtask/assets/design/buttons.dart';
import 'package:interviewtask/assets/design/shapes.dart';
import 'package:interviewtask/assets/design/texts.dart';
import 'package:interviewtask/assets/themes/colours.dart';
import 'package:interviewtask/logic/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController(), otpController = new TextEditingController();

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Text(
                "Phone Number",
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: TextField(
                decoration: Texts.p(),
                controller: phoneController,
                keyboardType: TextInputType.number,
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Text(
                "OTP",
                style: Texts.white(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: TextField(
                decoration: Texts.p(),
                controller: otpController,
                style: Texts.white(),
                obscureText: true,
              ),
            ),
            Container(
              child: Buttons.button("LOGIN", login),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      );

  void login() async {
    Validator.isLoginValid(context, phoneController.text, otpController.text);
  }
}
