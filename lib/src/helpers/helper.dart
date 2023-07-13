import 'dart:io';

import 'package:logger/logger.dart';

class Helper {

  String getMobileDevice() {
    String result = '';
    if (Platform.isAndroid) {
      result = 'android';
    } else {
      result = 'ios';
    }
    return result;
  }
}
var logger = Logger();