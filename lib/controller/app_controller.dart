import 'package:flutter/material.dart';
import 'package:interviewtask/api/api.dart';
import 'package:interviewtask/logic/validator.dart';
import 'package:interviewtask/utils/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController {
  static handleLogin(obj, context, phone, otp) {
    if (Validator.validatePhone(phone)) {
      Api.login(obj, context, phone, otp);
    } else {
      obj.phoneError();
    }
  }
}
