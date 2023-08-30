import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/themes/my_color.dart';
import 'package:temanbumil_web/src/themes/my_text_style.dart';

class CardTips extends StatelessWidget {
  final Function? onClick;
  final String? title;
  final String? cover;

  CardTips({required this.title, this.cover, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) onClick!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(9.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: MyColor.grey,
              backgroundImage: NetworkImage(cover!),
            ),
            MySizedBox.extraSmallHorizontal(),
            Flexible(
              child: Text(
                title ?? '',
                style: MyTextStyle.h5.bold.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
