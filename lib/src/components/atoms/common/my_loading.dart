import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyLoading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: MyColor.defaultPurple,
          rightDotColor: MyColor.defaultPurpleDarker,
          size: 50.h,
        ),
      ),
    );
  }
}
