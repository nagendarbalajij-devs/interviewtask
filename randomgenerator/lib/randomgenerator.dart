import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

class Randomgenerator {
  static const MethodChannel _channel = const MethodChannel('randomgenerator');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getRandom() async {
    if (Platform.isAndroid) {
      var v = await _channel.invokeMethod("getRandom");
      return v.toString();
    } else if (Platform.isIOS) {
      var v = await _channel.invokeMethod("getRandom");
      log("$v");
      return v.toString();
    }
  }
}
