import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/helpers/helper.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';

class CardArticleWidget extends StatelessWidget {
  final String? title;
  final String? cover;
  final String? category;
  final String? createdAt;
  final Function? onClicked;

  CardArticleWidget({
    this.title,
    this.cover,
    this.category,
    this.createdAt,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked!();
      },
      child: Material(
        elevation: 1.0,
        color: MyColor.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: <Widget>[
              Text(
                title ?? '',
                style: MyTextStyle.h5.bold.copyWith(color: MyColor.black),
              ),
              MySizedBox.extraSmallVertical(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(cover ?? ''),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: MyColor.grey200,
                ),
              ),
              MySizedBox.extraSmallVertical(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    category ?? '',
                    style: MyTextStyle.articleCategory.copyWith(color: MyColor.defaultPurple),
                  ),
                  Text(
                    Helper.formatDate(createdAt ?? ''),
                    style: MyTextStyle.articleCategory.copyWith(color: MyColor.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
