import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';

class MyTextField extends StatelessWidget {
  // final Key? key;
  final String? labelText;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final Function? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLine;
  final bool enabled;
  final Function? onClicked;
  final bool isArea;
  final List<TextInputFormatter> inputFormatters;
  final Function(bool)? onTextFieldTap;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Color disabledBorderColor;
  final bool isMandatory;
  final Key? keyTextField;
  final bool obscureText;

  MyTextField(
      {
      // this.key,
      this.controller,
      this.onChanged,
      this.onSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.errorText,
      this.maxLength,
      this.maxLine,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.onClicked,
      this.isArea = false,
      this.inputFormatters = const [],
      this.textInputAction = TextInputAction.done,
      this.onTextFieldTap,
      this.fillColor,
      this.hintStyle,
      this.disabledBorderColor = Colors.black,
      this.isMandatory = false,
      this.keyTextField,
      this.obscureText = false,
      Key? key})
      : assert(hintText != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        labelText != null
            ? Row(
                children: [
                  Text(labelText!, style: MyTextStyle.textFieldTitle),
                  if (isMandatory)
                    Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              )
            : Container(),
        MySizedBox.ultraSmallVertical(),
        GestureDetector(
          onTap: () {
            if (onClicked != null) {
              onClicked!();
            }
          },
          child: Container(
            // color: Colors.transparent,
            child: Container(
              child: Focus(
                onFocusChange: (focus) {
                  onTextFieldTap!(focus);
                },
                child: TextField(
                  key: keyTextField,
                  maxLines: maxLine ?? (isArea ? 5 : null),
                  enabled: enabled,
                  enableSuggestions: false,
                  keyboardType: keyboardType,
                  controller: controller,
                  obscureText: obscureText,
                  onChanged: (value) {
                    onChanged!(value);
                  },
                  onSubmitted: (value) {
                    onSubmitted!();
                  },
                  style: MyTextStyle.h6,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: MyColor.grey)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(color: disabledBorderColor),
                    ),
                    filled: true,
                    hintStyle: hintStyle ?? TextStyle(color: MyColor.grey),
                    hintText: hintText,
                    fillColor: fillColor,
                    errorText: (errorText ?? '') != '' ? errorText : null,
                    errorStyle: TextStyle(color: MyColor.red),
                  ),
                  inputFormatters: inputFormatters,
                  maxLength: maxLength,
                  textInputAction: textInputAction,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
