import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Validator {
  static getLoginStatus() async {
    if (await FirebaseAuth.instance.currentUser() == null) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePhone(phone) {
    if (phone.length == 10) {
      try {
        int _ = int.parse(phone);
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }
}
