import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyTheme {
  static light() {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: MyColor.defaultPurple,
      focusColor: MyColor.primary,
      textTheme: TextTheme(
          titleMedium: MyTextStyle.contentTitle,
          headlineMedium: MyTextStyle.bigTitle),
      colorScheme: const ColorScheme.light(),
    );
  }

  static dark() {
    return ThemeData.dark().copyWith(
        textTheme: Typography().white.apply(fontFamily: 'Nunito'),
        primaryColor: '#bf095d'.toColor());
  }
}
