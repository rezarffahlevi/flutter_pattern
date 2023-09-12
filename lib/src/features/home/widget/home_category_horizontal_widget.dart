import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeCategoryHorizontalWidget extends StatelessWidget {
  final List? categories;
  final int? selected;
  final Function(int value)? onTap;
  HomeCategoryHorizontalWidget({this.categories, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    logger.i(categories);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categories
                    ?.map((e) => InkWell(
                          onTap: () => onTap!(categories
                                  ?.indexWhere((element) => element == e) ??
                              0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.w),
                            child: Text(
                              '$e',
                              style: e == categories?[selected ?? 0]
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold)
                                  : Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ))
                    .toList() ??
                [],
          ),
        ),
      ),
    );
  }
}
