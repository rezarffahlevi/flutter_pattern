import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeSectionFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Home
    return HomeBgSection(
      image: MyAsset.image.bg1,
      child: Container(
        width: ResponsiveWidget.isSmallScreen(context) ? 0.6.sw : 0.3.sw,
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'home.content_title'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).primaryColorLight),
              ),
              MySizedBox.normalVertical(),
              Text(
                'home.content_desc'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
