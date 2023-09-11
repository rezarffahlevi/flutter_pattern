import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

/// [MyTextStyle] like css
/// easier when giving TextStyle and high custom
class MyTextStyle {
  static MyTextStyleFontWeight get h1 =>
      MyTextStyleFontWeight.custom(fontSize: 24.sp);

  static MyTextStyleFontWeight get h2 =>
      MyTextStyleFontWeight.custom(fontSize: 22.sp);

  static MyTextStyleFontWeight get h3 =>
      MyTextStyleFontWeight.custom(fontSize: 20.sp);

  static MyTextStyleFontWeight get h4 =>
      MyTextStyleFontWeight.custom(fontSize: 18.sp);

  static MyTextStyleFontWeight get h5 =>
      MyTextStyleFontWeight.custom(fontSize: 16.sp);

  static MyTextStyleFontWeight get h6 =>
      MyTextStyleFontWeight.custom(fontSize: 14.sp);

  static MyTextStyleFontWeight get h7 =>
      MyTextStyleFontWeight.custom(fontSize: 12.sp);

  static MyTextStyleFontWeight get h8 =>
      MyTextStyleFontWeight.custom(fontSize: 10.sp);

  static MyTextStyleFontWeight get h9 =>
      MyTextStyleFontWeight.custom(fontSize: 8.sp);

  static TextStyle get defaultStyle =>
      TextStyle(fontSize: 14.sp, fontFamily: 'Nunito');

  static TextStyle get defaultStyleBold =>
      defaultStyle.copyWith(fontWeight: MyFontWeight.bold);

  static TextStyle get defaultTitle =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.black, fontSize: 16.sp);

  static TextStyle get defaultSubTitle =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.black);

  static TextStyle get errorTitle => MyTextStyle.h1.bold;

  static TextStyle get errorTitleSmall => MyTextStyle.h4.bold;

  static TextStyle get noDataTitle => defaultStyle;

  static TextStyle get errorDescription =>
      MyTextStyle.h4.copyWith(color: MyColor.grey);

  static TextStyle get eulaTitle => MyTextStyle.h3.bold;

  static TextStyle get eulaDesc =>
      MyTextStyle.h6.normal.copyWith(color: MyColor.grey600);

  static TextStyle get eulaTitleSmall => MyTextStyle.h5.bold;

  static TextStyle get eulaDescSmall =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.grey600);

  static TextStyle get contentTitle => MyTextStyle.h4.bold;

  static TextStyle get contentSubTitle => MyTextStyle.h6.bold;

  static TextStyle get mediaTitle => MyTextStyle.h6;

  static TextStyle get mediaSubTitle => MyTextStyle.h7;

  static TextStyle get contentTitleWhite =>
      contentTitle.copyWith(color: MyColor.white);

  static TextStyle get recordTableTitle =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.grey);

  static TextStyle get recordTableContent => MyTextStyle.h6;

  static TextStyle get recordTabTitle =>
      MyTextStyle.h6.bold.copyWith(color: MyColor.grey);

  static TextStyle get recordNumberTitle => MyTextStyle.h5.bold;

  static TextStyle get recordNumberSubTitle =>
      MyTextStyle.h7.copyWith(color: MyColor.grey);

  static TextStyle get recordDescriptionTitle =>
      MyTextStyle.h6.bold.copyWith(color: MyColor.grey);

  static TextStyle get recordDescriptionSubTitle =>
      MyTextStyle.h6.copyWith(color: MyColor.grey);

  static TextStyle get bigTitle => MyTextStyle.h2.bold;

  static TextStyle get fetusTitle =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.white);

  static TextStyle get fetusSubTitle =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.white);

  static TextStyle get contentDescription =>
      MyTextStyle.h5.normal.copyWith(color: MyColor.grey600, fontSize: 14.sp);

  static TextStyle get contentDescriptionSmall =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.grey600);

  static TextStyle get contentDescriptionMedium =>
      MyTextStyle.h6.normal.copyWith(color: MyColor.grey600);

  static TextStyle get contentDescriptionSmallWhite =>
      contentDescriptionSmall.copyWith(color: MyColor.white);

  static TextStyle get contentDate =>
      MyTextStyle.h7.copyWith(color: MyColor.black);

  static TextStyle get appBarTitle => MyTextStyle.h5.normal
      .copyWith(fontSize: 16.sp, color: MyColor.defaultPurple);

  static TextStyle get searchSectionHeader => MyTextStyle.h6.semiBold
      .copyWith(color: MyColor.grey, fontFamily: 'Nunito');

  static TextStyle get searchSectionHeaderBold =>
      MyTextStyle.h6.extraBold.copyWith(color: MyColor.grey);

  static TextStyle get searchSectionDetail => MyTextStyle.h6.semiBold;

  static TextStyle get textFieldTitle =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.grey);

  static TextStyle get textFieldText =>
      MyTextStyle.h6.normal.copyWith(fontSize: 14.sp);

  static TextStyle get tabTitle =>
      MyTextStyle.h5.semiBold.copyWith(color: MyColor.black);

  static TextStyle get textFieldPlaceholder =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.grey400);

  //Journal
  static TextStyle get journalTitle =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.grey);

  //
  static TextStyle get articleTitle =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.black);

  static TextStyle get articleContentSmall =>
      MyTextStyle.h6.copyWith(color: MyColor.black);

  static TextStyle get popupTitle =>
      MyTextStyle.h4.bold.copyWith(color: MyColor.black);

  static TextStyle get articleCategoryBig =>
      MyTextStyle.h6.normal.copyWith(color: MyColor.black);

  //
  static TextStyle get articleCategory =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.black);

  static TextStyle get sectionTitleBold =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.black);

  static TextStyle get sponsoredText =>
      MyTextStyle.h7.light.copyWith(color: MyColor.defaultPurple);

  //In App Purchase
  static TextStyle get inAppPurchaseTitle =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseTitleSemiBold =>
      MyTextStyle.h5.semiBold.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseSectionTitleBold =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseSectionSecTitleSemiBold =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.colorFromHex('#11243D'));

  static TextStyle get inAppPurchaseItemTitleBold =>
      MyTextStyle.h5.bold.copyWith(color: MyColor.colorFromHex('#11243D'));

  static TextStyle get inAppPurchaseItemTitleSemiBold =>
      MyTextStyle.h6.bold.copyWith(color: MyColor.colorFromHex('#37474F'));

  static TextStyle get inAppPurchaseErrorSmall =>
      MyTextStyle.h7.bold.copyWith(color: MyColor.red);

  static TextStyle get inAppPurchaseItemTitleBold24 =>
      MyTextStyle.h1.bold.copyWith(color: MyColor.colorFromHex('#11243D'));

  static TextStyle get inAppPurchaseTextErrorNormal14 =>
      MyTextStyle.h6.normal.copyWith(color: MyColor.colorFromHex('#E80047'));

  static TextStyle get inAppPurchaseItemSubTitle =>
      MyTextStyle.h6.semiBold.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseItemDescription =>
      MyTextStyle.h5.normal.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseItemDescriptionNormal16 =>
      MyTextStyle.h5.normal.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseItemNomorPesananNormal12 =>
      MyTextStyle.h6.normal.copyWith(color: MyColor.colorFromHex('#707A89'));

  static TextStyle get inAppPurchaseItemVoucherStatusNormal12 =>
      MyTextStyle.h7.normal.copyWith(color: MyColor.colorFromHex('#AEB4BE'));

  static TextStyle get inAppPurchaseItemDescriptionKuponNormal16 =>
      MyTextStyle.h5.normal.copyWith(color: MyColor.colorFromHex('#95A0AE'));

  static TextStyle get inAppPurchaseTextButton =>
      MyTextStyle.h6.bold.copyWith(color: MyColor.white);

  static TextStyle get filterTitle =>
      MyTextStyle.h5.semiBold.copyWith(color: MyColor.colorFromHex('#11243D'));

  static TextStyle get bottomSheetTitle =>
      MyTextStyle.h3.bold.copyWith(color: MyColor.black);

  static TextStyle get bottomSheetContent => MyTextStyle.h5.copyWith(
        color: MyColor.black,
        fontFamily: 'Nunito',
      );

  static TextStyle get seeAllButton => defaultStyle.copyWith(
        color: MyColor.black54,
        decoration: TextDecoration.none,
      );

  static TextStyle get sessionTitle =>
      MyTextStyle.h5.semiBold.copyWith(color: MyColor.black);

  static TextStyle get milestoneTitle => TextStyle(
      fontSize: 32.sp,
      fontWeight: MyFontWeight.ultraBold,
      color: MyColor.white);

  static TextStyle get buttonTitle => h4.normal.copyWith(color: MyColor.black);

  static TextStyle get smallButtonTitle =>
      h6.semiBold.copyWith(color: MyColor.grey600);

  static TextStyle get newSectionHeader => MyTextStyle.h5.bold;

  static TextStyle get newSectionSmall => MyTextStyle.h6.semiBold;

  static TextStyle get snackBarDescription => TextStyle(
        fontFamily: 'Nunito',
        fontWeight: MyFontWeight.bold,
      );

  static TextStyle get mediaIconStyle => TextStyle(color: MyColor.grey);

  static TextStyle get tabBarTitle => TextStyle(
        fontFamily: 'Nunito',
        fontSize: 13.sp,
        fontWeight: MyFontWeight.semiBold,
      );
}

// ignore: must_be_immutable
class MyTextStyleFontWeight extends Palette {
  double? fontSize;

  MyTextStyleFontWeight();

  MyTextStyleFontWeight.custom({this.fontSize});

  TextStyle get _thin => TextStyle(
        fontWeight: MyFontWeight.thin,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _extraLight => TextStyle(
        fontWeight: MyFontWeight.extraLight,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _light => TextStyle(
        fontWeight: MyFontWeight.light,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _normal => TextStyle(
        fontWeight: MyFontWeight.normal,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _medium => TextStyle(
        fontWeight: MyFontWeight.medium,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _semiBold => TextStyle(
        fontWeight: MyFontWeight.semiBold,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _bold => TextStyle(
        fontWeight: MyFontWeight.bold,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _extraBold => TextStyle(
        fontWeight: MyFontWeight.extraBold,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  TextStyle get _ultraBold => TextStyle(
        fontWeight: MyFontWeight.ultraBold,
        color: Colors.black,
        fontSize: this.fontSize,
        fontFamily: 'Nunito',
      );

  @override
  TextStyle get thin => _thin;

  @override
  TextStyle get extraLight => _extraLight;

  @override
  TextStyle get light => _light;

  @override
  TextStyle get normal => _normal;

  @override
  TextStyle get medium => _medium;

  @override
  TextStyle get semiBold => _semiBold;

  @override
  TextStyle get bold => _bold;

  @override
  TextStyle get extraBold => _extraBold;

  @override
  TextStyle get ultraBold => _ultraBold;

//  @override
//  TextStyle tint(Color color) => TextStyle(color: color);
}

abstract class Palette extends TextStyle {
  Palette();

  TextStyle get thin;

  TextStyle get extraLight;

  TextStyle get light;

  TextStyle get normal;

  TextStyle get medium;

  TextStyle get semiBold;

  TextStyle get bold;

  TextStyle get extraBold;

  TextStyle get ultraBold;

// TextStyle tint(Color color);
}
