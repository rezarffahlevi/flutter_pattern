import 'package:flutter/material.dart';

class MyColor {
  static Color primary = Color(0xFFbf095d);
  static Color homeBackground = Colors.grey[100]!;
  static Color homeBackground2 = Color(0xFFF9F9FB);
  static Color buttonEnabled = Color(0xFF5A8DF6);
  static Color buttonDisabled = Color(0xFFC9D7F5);
  static Color buttonDisabledGrey = Color(0xFFE6E6EB);
  static Color buttonNegativeEnabled = Color(0xFFF28F92);

  //in app purchase
  static Color inAppPurchaseBackground = colorFromHex('#f8f8fa');
  static Color inAppPurchaseBackgroundSearch = colorFromHex('#F9F9FB');
  static Color inAppPurchaseSectionFontColor = colorFromHex('#707A89');
  static Color inAppPurchaseCircleButton = colorFromHex('#B68DC3');
  static Color inAppPurchaseSmallCircleButton = colorFromHex('#C3C3C3');
  static Color inAppPurchasePesananBerhasilFontColor = colorFromHex('#A5A5D6');
  static Color inAppPurchasePesananBerhasilRincianFontColor = colorFromHex('#11243D');
  static Color inAppPurchaseBtnPesan = colorFromHex('#FF970A');
  static Color inAppPurchaseDateUnpaid = colorFromHex('#E8B679');
  static Color inAppPurchaseRefundFontColor = colorFromHex('#01A743');
  static Color inAppPurchaseOrangeFont = colorFromHex('#EA481B');
  static Color inAppPurchaseProductDescColor = colorFromHex('#606D7D');
  static Color inAppPurchaseProductFreeShipping = colorFromHex('#34AC08');

  static const Color grey = Colors.grey;
  static Color? grey50 = Colors.grey[50];
  static Color? grey100 = Colors.grey[100];
  static Color? grey200 = Colors.grey[200];
  static Color? grey300 = Colors.grey[300];
  static Color? grey350 = Colors.grey[350];
  static Color? grey400 = Colors.grey[400];
  static Color? grey600 = Colors.grey[600];
  static Color greyPlaceHolder = Color(0xFFE8E9E8);

  static Color black = Colors.black;
  static Color black87 = Colors.black87;
  static Color black54 = Colors.black54;
  static Color black45 = Colors.black45;

  static Color white = Colors.white;

  static Color defaultCream = Color(0xFFFEE6DA);

  static Color defaultPurple = Color(0xFFA778B7);
  static Color defaultPurpleHome = Color(0xFFB681B6);
  static Color defaultPurpleHomeDarker = Color(0xFF9074b5);
  static Color purpleButtonSharePromotion = colorFromHex('#B78EC3');
  static Color purpleCarousel = Color(0xFFF3DBEA);
  static Color purplePregnantQuestion = Color(0xFFB78EC3);
  static Color purplePregnantQuestionFrame = Color(0xFFE4C2EE);
  static Color defaultPurpleLighter = Color(0xFFD8C3DF);
  static Color defaultPurpleDarker = Color(0xFF8E8CC4);
  static Color defaultPink = Color(0xFFF1A1C2);
  static Color defaultFontColor = colorFromHex('#707A89');
  static Color defaultSoftPurple = colorFromHex('#F5C5DC');

  static const Color transparent = Colors.transparent;

  static Color defaultBlue = Color(0xFF9DB7ED);
  static Color blueFacebook = Color(0xFF3B5998);
  static Color blueLink = Color(0xFF7881FF);
  static Color blue = Colors.blue;
  static Color blueLighter = Color(0xFF2E7BE4);
  static Color blueLightNotification = Color(0xFFE6EDFD);
  static Color blueHome = Color(0xFF5E6FD5);
  static Color blueIAPRefund = colorFromHex('#2E7BE4');
  static Color blueHomeAddFetus = colorFromHex('#ACAEE2');
  static Color blueHomeFontAddFetus = colorFromHex('#5E6FD5');

  // static Color blueAqua = Color(0xFF7A88F7);
  static Color blueAqua = Color(0xFF0047BB);

  static Color blueLightAqua = Color(0xFFBFC5FC);
  static Color blueLighterAqua = Color(0xFFE4EBF5);

  static Color blueLoyaltyPointInactive = Color(0xFFDEEBFE);
  static Color blueLoyaltyPointActive = Color(0xFFACAEE2);
  static Color blueTemanBumil = Color(0xFFACAEE2);
  static Color purpleLoyaltyPoint = Color(0xFF6F70FB);

  static Color red = Colors.red;
  static Color redGoogle = Color(0xFFDD4A38);

  static Color green = Colors.green;

  static Color recordBlue = Color(0xFF27BDF0);
  static Color recordGreen = Color(0xFF9ECF56);
  static Color recordOrange = Color(0xFFE7A26B);

  static Color lightPurple = Color(0xFFbfc6fa);

  static Color amber = Colors.amber;

  static Color defaultOrange = Color(0xFFEDAC9D);
  static Color defaultGreen = Color(0xFF83C989);
  static Color greenMoveCommunityRadio = colorFromHex('#44D88D');

  //Mision
  static Color missionRewardFontColor = colorFromHex('#81B885');
  static Color mumsPoinColor = colorFromHex('#6F70FB');
  static Color top1LeaderboardColor = colorFromHex('#FACA57');
  static Color top2LeaderboardColor = colorFromHex('#EBEBEB');
  static Color top3LeaderboardColor = colorFromHex('#D5C1B8');
  static Color missionGreen = colorFromHex('#90CE95');

  //community campaign
  static Color backgroundCircleCampaign = colorFromHex('#FFF4E0');
  static Color backgroundDetailCampaign = colorFromHex('#ED79AC');

  static Color colorFromHex(String? hexColor) {
    if (hexColor == null) return defaultFontColor;

    try {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      return Color(int.parse(hexColor, radix: 16));
    } catch (e, s) {
      print(s);
      return Colors.grey;
    }
  }
}
