import 'package:flutter/material.dart';
import 'package:interviewtask/utils/sizes.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator {
  static Widget generateImage(String value) {
    return QrImage(
      data: value,
      version: QrVersions.auto,
      size: Sizes.ofWidth(50),
    );
  }

  static Widget generateOldImage(String value) {
    return QrImage(
      data: value,
      version: QrVersions.auto,
      size: Sizes.ofWidth(25),
    );
  }
}
