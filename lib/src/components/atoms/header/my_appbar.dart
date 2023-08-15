import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/app.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/themes/my_text_style.dart';

class MyAppbar extends StatelessWidget {
  double? opacity;
  List<dynamic>? menu;
  Function(int index, bool value)? onHover;
  Function(BuildContext context, int index, dynamic data)? onTap;

  MyAppbar({this.opacity, this.menu, this.onHover, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (ResponsiveWidget.isSmallScreen(context)) {
      return AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            splashColor: Theme.of(context).primaryColor,
            highlightColor: Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              App.of(context).toggleTheme();
            },
          ),
        ],
        title: Text(
          'Teman Bumil',
          style: MyTextStyle.appBarTitle,
        ),
      );
    } else {
      return PreferredSize(
        preferredSize: Size(1.sw, 80.h),
        child: MyAppbarWeb(
          opacity: opacity,
          menu: menu ?? [],
          onHover: onHover,
          onTap: onTap,
        ),
      );
    }
  }
}
