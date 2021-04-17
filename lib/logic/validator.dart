import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Validator {
  static Future<bool> isLoginValid(context, phone, otp) async {
    //return true;
    bool isValid = false;

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phone}",
      timeout: Duration(seconds: 10),
      verificationCompleted: (phoneAuthCredential) {
        log("message");
      },
      verificationFailed: (error) {},
      codeSent: (verificationId, [forceResendingToken]) async {
        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: otp);
        AuthResult result = await FirebaseAuth.instance.signInWithCredential(credential);
        log("auth done");
        log("${result.user}");
        if (result.user != null) {
          isValid = true;
          Navigator.pushReplacementNamed(context, '/plugin');
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );

    return isValid;
  }

  static getLoginStatus() async {
    if (await FirebaseAuth.instance.currentUser() == null) {
      return false;
    } else {
      return true;
    }
  }
}
