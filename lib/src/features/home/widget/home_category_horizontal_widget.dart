import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/components.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_app_section_banner.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeCategoryHorizontalWidget extends StatelessWidget {
  final List? categories;
  final String? selected;
  final Function(String value)? onTap;
  HomeCategoryHorizontalWidget({this.categories, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories
                ?.map((e) => InkWell(
                      onTap: () => onTap!(e),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 4.w),
                        child: Text(
                          e,
                          style: e == selected ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold) : Theme.of(context)
                              .textTheme
                              .titleSmall,
                        ),
                      ),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
