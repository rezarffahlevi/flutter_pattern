import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyTheme {
  static ThemeData light() {
    return ThemeData(
      fontFamily: 'Nunito',
      primaryColor: MyColor.defaultPurple,
      hoverColor: MyColor.white,
      textTheme: TextTheme(
        headlineLarge: MyTextStyle.h1.bold.copyWith(color: MyColor.black),
        headlineMedium: MyTextStyle.h3.bold.copyWith(color: MyColor.black),
        headlineSmall: MyTextStyle.h5.bold.copyWith(color: MyColor.black),

        labelLarge: MyTextStyle.h1.semiBold.copyWith(color: MyColor.black),
        labelMedium: MyTextStyle.h3.semiBold.copyWith(color: MyColor.black),
        labelSmall: MyTextStyle.h5.semiBold.copyWith(color: MyColor.black),

        displayLarge: MyTextStyle.defaultStyle,
        displayMedium: MyTextStyle.defaultStyle,
        displaySmall: MyTextStyle.defaultStyle,

        titleLarge: MyTextStyle.bigTitle,
        titleMedium: MyTextStyle.contentTitle,
        titleSmall: MyTextStyle.defaultTitle,

      ),
      colorScheme: ColorScheme.light().copyWith(
        primary: MyColor.defaultPurple,
        surface: MyColor.black,
        inverseSurface: MyColor.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyColor.defaultPurple,
        hoverColor: MyColor.primary,
      ),
    );
  }

  static dark() {
    return ThemeData.dark().copyWith(
      primaryColor: MyColor.defaultPurple,
      hoverColor: MyColor.black,
      textTheme: TextTheme(
        headlineLarge: MyTextStyle.h1.bold.copyWith(color: MyColor.white),
        headlineMedium: MyTextStyle.h3.bold.copyWith(color: MyColor.white),
        headlineSmall: MyTextStyle.h5.bold.copyWith(color: MyColor.white),

        labelLarge: MyTextStyle.h1.semiBold.copyWith(color: MyColor.white),
        labelMedium: MyTextStyle.h3.semiBold.copyWith(color: MyColor.white),
        labelSmall: MyTextStyle.h5.semiBold.copyWith(color: MyColor.white),

        displayLarge: MyTextStyle.defaultStyle.copyWith(color: MyColor.white),
        displayMedium: MyTextStyle.defaultStyle.copyWith(color: MyColor.white),
        displaySmall: MyTextStyle.defaultStyle.copyWith(color: MyColor.white),

        titleLarge: MyTextStyle.bigTitle.copyWith(color: MyColor.white),
        titleMedium: MyTextStyle.contentTitle.copyWith(color: MyColor.white),
        titleSmall: MyTextStyle.defaultTitle.copyWith(color: MyColor.white),
      ).apply(
        fontFamily: 'Nunito',
      ),
      colorScheme: ColorScheme.light().copyWith(
        primary: MyColor.defaultPurple,
        surface: MyColor.white,
        inverseSurface: MyColor.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyColor.defaultPurple,
        hoverColor: MyColor.primary,
      ),
    );
  }
}
