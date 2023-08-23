import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class MyTheme {
  static light() {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: '#bf095d'.toColor()
    );
  }

  static dark() {
    return ThemeData.dark().copyWith(
      textTheme: Typography().white.apply(fontFamily: 'Nunito'),
      primaryColor: '#bf095d'.toColor()
    );
  }
}
