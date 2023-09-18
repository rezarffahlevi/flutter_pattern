import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/themes/themes.dart';
import 'package:temanbumil_web/src/widgets/widgets.dart';

// ignore: must_be_immutable
class ChecklistItemWidget extends StatefulWidget {
  bool isChecked;
  final Function? onClicked;
  final Function? onClickedMore;
  final ChecklistNode checklistNode;

  ChecklistItemWidget(this.checklistNode, {this.isChecked = false, this.onClicked, this.onClickedMore}) {}

  @override
  _ChecklistItemWidgetState createState() => _ChecklistItemWidgetState();
}

class _ChecklistItemWidgetState extends State<ChecklistItemWidget> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final urlAds = widget.checklistNode?.urlAds;
    final isShowUrl = !(urlAds == '' || urlAds == null);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(
                widget.checklistNode?.description ?? '',
                textStyle: TextStyle(
                    fontWeight: isShowUrl ? MyFontWeight.bold : MyFontWeight.normal,
                    decoration: widget.isChecked ? TextDecoration.lineThrough : TextDecoration.none),
                enableCaching: false,
              ),
              isShowUrl ? MySizedBox.smallVertical() : Container(),
              isShowUrl
                  ? RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.blue, fontSize: 14.sp, fontWeight: MyFontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Lihat Selengkapnya',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.onClickedMore!();
                              },
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        MySizedBox.extraSmallHorizontal(),
        GestureDetector(
          onTap: () async {
            try {
              await widget.onClicked!();
              setState(() {
                widget.isChecked = !widget.isChecked;
              });
            } catch (e) {
              Helper.showErrorToast(e);
            }
          },
          child: widget.isChecked
              ? Image.asset(
                  MyAsset.checklistCheckedGreen,
                  width: 35.sp,
                  height: 35.sp,
                  key: Key('ChecklistCheckItem${widget?.checklistNode?.checkId}'),
                )
              : Image.asset(
                  MyAsset.checklistUnchecked,
                  width: 35.sp,
                  height: 35.sp,
                  key: Key('ChecklistCheckItem${widget?.checklistNode?.checkId}'),
                ),
        ),
      ],
    );
  }
}
