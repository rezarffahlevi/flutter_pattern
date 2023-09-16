import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

// ignore: must_be_immutable
class MyButtonText extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double fontSize;
  Key? key;
  final Key? keyButton;
  final Key? keyText;

  MyButtonText({
    required this.title,
    required this.onTap,
    this.color,
    this.padding,
    this.textStyle,
    this.fontSize = 14,
    this.key,
    this.keyButton,
    this.keyText,
  })  : assert(onTap != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: keyButton,
      onTap: () {
        onTap();
      },
      child: Container(
        padding: padding ?? EdgeInsets.only(top: 12, bottom: 32),
        child: Text(
          key: keyText,
          title,
          style: TextStyle(
                  fontSize: fontSize,
                  color: color ?? MyColor.defaultBlue,
                  fontWeight: FontWeight.bold)
              .merge(textStyle),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
