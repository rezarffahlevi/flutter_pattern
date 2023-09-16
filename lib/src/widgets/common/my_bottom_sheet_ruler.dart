import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';

class MyBottomSheetRuler extends StatelessWidget {
  Widget ruler(double width) {
    return Center(
      child: Container(
        width: width,
        height: 5,
        decoration: BoxDecoration(
          color: MyColor.grey200,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ruler(60),
        MySizedBox.bloodySmallVertical(),
        ruler(40),
        MySizedBox.extraSmallVertical(),
      ],
    );
  }
}
