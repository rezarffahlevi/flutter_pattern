import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: MyColor.defaultPurple,
      // focusColor: MyColor.primary,
      // hoverColor: MyColor.primary,
      textTheme: TextTheme(
          headlineLarge: MyTextStyle.h1.bold.copyWith(color: MyColor.black),
          headlineMedium: MyTextStyle.h3.bold.copyWith(color: MyColor.black)),
      colorScheme: ColorScheme.light().copyWith(
        primary: MyColor.black,
      ),
    );
  }

  static dark() {
    return ThemeData.dark().copyWith(
      textTheme: TextTheme(
        headlineLarge: MyTextStyle.h1.bold.copyWith(color: MyColor.white),
        headlineMedium: MyTextStyle.h3.bold.copyWith(color: MyColor.white),
      ).apply(fontFamily: 'Nunito',),
      primaryColor: MyColor.defaultPurple,
      // focusColor: MyColor.primary,
      colorScheme: ColorScheme.light().copyWith(
        primary: MyColor.white,
      ),
    );
  }
}
