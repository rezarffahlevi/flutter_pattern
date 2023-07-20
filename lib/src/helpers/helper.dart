import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

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
                decoration: BoxDecoration(
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
  
}
var logger = Logger();