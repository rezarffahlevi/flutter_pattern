import 'package:flutter/material.dart';

class MyTheme {
  static light() {
    return ThemeData(
      fontFamily: 'Nunito',
    );
  }

  static dark() {
    return ThemeData.dark().copyWith(
      textTheme: Typography().white.apply(fontFamily: 'Nunito'),
    );
  }
}
