import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/molecules/card/card.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeAppSectionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Home
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: (ResponsiveWidget.isSmallScreen(context) ? 60.h : 80.h) + 30.w,
          bottom: 30.w),
      color: '#CBC3E3'.toColor().withOpacity(0.2),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 0.5.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'home.content_title'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  MySizedBox.normalVertical(),
                  Text(
                    'home.content_desc'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  MyAsset.food,
                  fit: BoxFit.contain,
                  width: 50.w,
                ),
                Image.asset(
                  MyAsset.doctor,
                  fit: BoxFit.contain,
                  width: 50.w,
                ),
              ],
            ),
          ]),
    );
  }
}
