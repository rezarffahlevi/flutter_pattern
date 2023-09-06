import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyErrorWidget extends StatelessWidget {
  final String? message;
  MyErrorWidget(this.message);
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySizedBox.smallVertical(),
        Icon(
          Icons.error,
          size: 60.sp,
          color: MyColor.red,
        ),
        MySizedBox.extraSmallVertical(),
        Text(
          '${Helper.getErrorMessage(message)}',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        MySizedBox.smallVertical(),
      ],
    );
  }
}
