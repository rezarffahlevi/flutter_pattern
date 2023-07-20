import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/themes/my_font_weight.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyButtonRounded extends StatelessWidget {
  final String? title;
  final bool? enabled;
  final Function? onClicked;
  final Color? textColor;
  final Color? color;
  final Color? disabledColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final Key? keyText;
  final Key? keyButton;

  MyButtonRounded({
    this.title,
    this.onClicked,
    this.enabled = true,
    this.textColor,
    this.color,
    this.disabledColor,
    Key? key,
    this.borderRadius = 100.0,
    this.horizontalPadding,
    this.keyText,
    this.keyButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: keyButton ?? Key('RoundedButton'),
      onPressed: !enabled!
          ? null
          : () {
              onClicked!();
            },
      child: Text(
        key: keyText,
        title!,
        style: TextStyle(fontWeight: MyFontWeight.bold),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Colors.white,
        disabledForegroundColor: Colors.white,
        backgroundColor: color ?? MyColor.buttonEnabled,
        disabledBackgroundColor: disabledColor ?? MyColor.buttonDisabled,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: horizontalPadding ?? 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
