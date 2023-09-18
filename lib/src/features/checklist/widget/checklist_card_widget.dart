import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/features/checklist/widget/checklist_item_widget.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

// ignore: must_be_immutable
class ChecklistCardWidget extends StatelessWidget {
  final bool isExpanded;
  ExpandableController? controller;
  final ChecklistItemModel checklistItemModel;
  final Function(ChecklistNode checklistNode)? eventChecklistClicked;

  ChecklistCardWidget(this.checklistItemModel, {this.eventChecklistClicked, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      controller = ExpandableController();
      controller!.expanded = isExpanded;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.w),
      child: Material(
        elevation: 1.0,
        color: MyColor.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          key: Key('ChecklistExpandedItem${checklistItemModel?.checklistId}'),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColor.white,
          ),
          child: ExpandablePanel(
            controller: controller,
            header: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: MyColor.colorFromHex(checklistItemModel?.color),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        checklistItemModel?.title ?? '',
//                      forumModel?.category?.title ?? '',
                        style: MyTextStyle.h7.copyWith(color: MyColor.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            expanded: ListView.separated(
              padding: EdgeInsets.only(top: 10.w),
              shrinkWrap: true,
              itemCount: checklistItemModel?.checklistNode?.length ?? 0,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (c, i) {
                return Divider();
              },
              itemBuilder: (c, i) {
                final node = checklistItemModel?.checklistNode![i];
                if (node == null) return Container();
                return ChecklistItemWidget(
                  node,
                  isChecked: node?.checked ?? false,
                  onClicked: () async {
                    await eventChecklistClicked!(node);
                  },
                  onClickedMore: () async {
                    try {
                      await Helper.htmlWidgetUrlOnTapped(node.urlAds ?? '');
                    } catch (e) {
                      throw Exception(e);
                    }
                  },
                );
              },
            ),
            theme: ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
            ),
            collapsed: Container(),
          ),
        ),
      ),
    );
  }
}
