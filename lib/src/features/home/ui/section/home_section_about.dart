import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/components/molecules/card/card.dart';
import 'package:temanbumil_web/src/features/home/widget/home_bg_section.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeSectionAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Home
    return CardParallax(
      aspectRatio:
          ResponsiveWidget.isSmallScreen(context) ? 16 / 16 : 16 / 8,
      imageUrl: MyAsset.background.bg3,
      customGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        // stops: [0.4, 0.2],
        colors: [
          '#a50082'.toColor().withOpacity(0.8),
          '#cc900a'.toColor().withOpacity(0.6),
        ],
      ),
      child: Container(
        width: Helper.responsive(context, lg: 0.3.sw, md: 0.5.sw, sm: 0.7.sw),
        height: 1.sh,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'home.content_title'.tr(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              MySizedBox.normalVertical(),
              Text(
                'home.content_desc'.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
