import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;
import 'package:logger/logger.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static final FToast fToast = FToast();

  static double responsive(BuildContext context, {double? sm, double? md, required double lg}) {
    bool small = MediaQuery.of(context).size.width < 800;
    bool medium = MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width <= 1200;
    bool large = MediaQuery.of(context).size.width > 1200;

    if (large)
      return lg;
    else if (medium)
      return md ?? lg;
    else
      return sm ?? lg;
  }

  static void showToast(String msg, {String? type = 'info'}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: type == 'error'
            ? Colors.redAccent
            : type == 'success'
                ? Colors.greenAccent
                : Colors.black54,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
              type == 'error'
                  ? Icons.error
                  : type == 'success'
                      ? Icons.check
                      : Icons.info,
              color: Colors.white),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            '$msg',
            style: MyTextStyle.defaultStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  static String getErrorMessage(e) {
    String rawResult = removeAllHtmlTags(e.toString().replaceAll('Exception: ', ''));
    final list = rawResult.split('\nErrorCode=');
    return list.first;
  }

  /// return error code;
  static void showErrorToast(e) {
    String rawResult = getErrorMessage(e);
    showToast(rawResult, type: 'error');
  }

  static String removeAllHtmlTags(String htmlText) {
    if ((htmlText ?? '') == '') return '';
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static FutureOr<bool> htmlWidgetUrlOnTapped(String url) async {
    logger.i('URL Tapped : $url');
    if (url != null) await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    return true;
  }

  static bool isLoadingPopupShown = false;

  static void showLoadingPopup(BuildContext? context, {isVisible = true}) {
    if (isLoadingPopupShown) return;

    isLoadingPopupShown = true;

    if (isVisible) {
      showGeneralDialog(
        context: context!,
        barrierColor: Colors.black12.withOpacity(0.2),
        // background color
        barrierDismissible: false,
        // should dialog be dismissed when tapped outside
        barrierLabel: "Dialog",
        // label for barrier
        transitionDuration: Duration(milliseconds: 400),
        // how long it takes to popup dialog after button click
        pageBuilder: (_, __, ___) {
          // your widget implementation
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CircularProgressIndicator(
                  color: MyColor.defaultPurple,
                ),
              ),
            ),
          );
        },
      );
    } else {
      showGeneralDialog(
        context: context!,
        barrierColor: Colors.black12.withOpacity(0.01),
        // background color
        barrierDismissible: false,
        // should dialog be dismissed when tapped outside
        barrierLabel: "Dialog",
        // label for barrier
        transitionDuration: Duration(milliseconds: 400),
        // how long it takes to popup dialog after button click
        pageBuilder: (_, __, ___) {
          // your widget implementation
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(),
          );
        },
      );
    }
  }

  static void dismissLoadingPopup(BuildContext? context) {
    if (!isLoadingPopupShown) return;

    isLoadingPopupShown = false;
    Navigator.pop(context!);
  }

  String getMobileDevice() {
    String result = '';
    if (Platform.isAndroid) {
      result = 'android';
    } else {
      result = 'ios';
    }
    return result;
  }

  static Future<void> showBottomSheetWidget(
    BuildContext context, {
    String? title,
    Widget? widget,
    String? image,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showCloseButton = false,
    Key? keyClose,
    bool removeBottomPadding = false,
    Function? closeClicked,
    Color? barrierColor,
    IconData closeIcon = Icons.close,
    BoxConstraints? constraints,
    Key? keyInnerClose,
    bool useSafeArea = false,
  }) async {
    Widget _closeButton = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 30),
        MyBottomSheetRuler(),
        GestureDetector(
          onTap: () {
            if (closeClicked != null) closeClicked();
            Navigator.pop(context);
          },
          child: Icon(
            key: keyInnerClose,
            closeIcon,
            size: 30,
            color: MyColor.black87,
          ),
        ),
      ],
    );

    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      barrierColor: barrierColor,
      constraints: constraints,
      useSafeArea: useSafeArea,
      builder: (_) => WillPopScope(
        onWillPop: () async => isDismissible,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showCloseButton ? _closeButton : MyBottomSheetRuler(),
                    MySizedBox.extraSmallVertical(),
                    image != null
                        ? Image.asset(
                            image,
                            height: 150,
                          )
                        : Container(),
                    title != null
                        ? Text(
                            title,
                            key: Key('BottomSheetTitle'),
                            style: MyTextStyle.bottomSheetTitle,
                            textAlign: TextAlign.center,
                          )
                        : Container(),
                    MySizedBox.extraSmallVertical(),
                    widget ??
                        Container(
                          height: 50,
                        ),
                    if (!removeBottomPadding) MySizedBox.extraLargeVertical(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String formatDate(String date, {String format = 'dd MMMM yyyy'}) {
    try {
      initializeDateFormatting();
      return intl.DateFormat(format, 'id').format(DateTime.parse(date));
    } catch (e) {
      print(e.toString());
      return '-';
    }
  }

  static String formatDateWithDay(String date, {String format = 'EEEE, dd MMMM yyyy'}) {
    try {
      initializeDateFormatting();
      return intl.DateFormat(format, 'id').format(DateTime.parse(date));
    } catch (e) {
      print(e.toString());
      return '-';
    }
  }

  static String formatDateTime(String date, {String format = 'dd MMMM yyyy HH:mm'}) {
    try {
      initializeDateFormatting();
      return intl.DateFormat(format, 'id').format(DateTime.parse(date));
    } catch (e) {
      print(e.toString());
      return '-';
    }
  }

  static String formatDateTimeFromInt(int date, {String format = 'dd MMMM yyyy HH:mm'}) {
    print('formatDateTimeFromInt $date');
    try {
      initializeDateFormatting();
      return intl.DateFormat(format, 'id').format(DateTime.fromMillisecondsSinceEpoch(date));
    } catch (e) {
      print(e.toString());
      return '-';
    }
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static Future<void> addDelay(int seconds) async {
    await Future.delayed(Duration(seconds: seconds), () {});
  }

  static Future<void> addDelayInMS(int t) async {
    await Future.delayed(Duration(milliseconds: t), () {});
  }
}

var logger = Logger();
