import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Api {
  static Future<String> getPrevious() async {
    String type = "millisecond";
    if (Platform.isAndroid) {
      type = "random";
    }
    Firestore fs = Firestore.instance;
    var snapshot = await fs.collection("randoms").where('type', isEqualTo: "$type").orderBy('timestamp', descending: true).limit(1).getDocuments();
    if (snapshot.documents.isNotEmpty) {
      return snapshot.documents[0]['value'].toString();
    } else {
      return null;
    }
  }

  static saveValue(String value) async {
    String type = "millisecond";
    if (Platform.isAndroid) {
      type = "random";
    }

    var image = await QrPainter(
      data: value,
      version: QrVersions.auto,
      gapless: false,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImage(200);
    final a = await image.toByteData(format: ImageByteFormat.png);
    FirebaseStorage.instance.ref().child("images/${value}.png").putData(a.buffer.asUint8List());
    Firestore fs = Firestore.instance;
    await fs.collection("randoms").add({"value": value, "type": "$type", "timestamp": FieldValue.serverTimestamp()});
    //await FirebaseStorage.instance.ref();
    return;
  }

  static login(obj, context, phone, otp) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phone}",
      timeout: Duration(seconds: 10),
      verificationCompleted: (phoneAuthCredential) async {
        log("verification complete");
        AuthResult result = await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        if (result.user != null) {
          Navigator.pushReplacementNamed(context, '/plugin');
        }
      },
      verificationFailed: (error) {
        obj.resetLogin();
        log("verification falied");
      },
      codeSent: (verificationId, [forceResendingToken]) async {
        if (otp == "") {
          obj.otpSent();
          return;
        }
        try {
          AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: otp);
          AuthResult result = await FirebaseAuth.instance.signInWithCredential(credential);
          log("auth done");
          log("${result.user}");
          if (result.user != null) {
            Navigator.pushReplacementNamed(context, '/plugin');
          }
        } catch (e) {
          obj.resetLogin();
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static logout() async {
    await FirebaseAuth.instance.signOut();
    return;
  }
}
