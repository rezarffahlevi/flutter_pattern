import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/atoms/header/my_appbar_web.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/my_asset.dart';

class HomeBgSection extends StatelessWidget {
  final Widget? child;
  final String? image;

  HomeBgSection({this.child, this.image});

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Stack(
      children: [
        image != null
            ? Container(
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                  width: screenSize.width,
                  height: screenSize.height,
                ),
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  // stops: [0.4, 0.2],
                  colors: [
                    '#a50082'.toColor().withOpacity(0.8),
                    '#cc900a'.toColor().withOpacity(0.6),
                  ],
                )),
              )
            : Container(),
        child ?? Container()
      ],
    );
  }
}
