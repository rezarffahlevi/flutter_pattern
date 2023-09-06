import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class MyAppbarWeb extends StatefulWidget {
  double? opacity;
  List<dynamic> menu = [];
  Function(int index, bool value)? onHover;
  Function(BuildContext context, int index, dynamic data)? onTap;
  MyAppbarWeb(
      {Key? key, this.opacity, required this.menu, this.onHover, this.onTap})
      : super(key: key);

  @override
  State<MyAppbarWeb> createState() => _MyAppbarWebState();
}

class _MyAppbarWebState extends State<MyAppbarWeb> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(1.sw, 80.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
        color:
            Theme.of(context).primaryColor.withOpacity(widget.opacity ?? 9.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySizedBox.bloodySmallHorizontal(),
            Image.asset(MyAsset.logoWhite),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.menu.isNotEmpty)
                    ...widget.menu.map(
                      (e) {
                        final index = widget.menu.indexWhere(
                            (element) => element['menu'] == e['menu']);
                        return Row(
                          children: [
                            InkWell(
                              onHover: (value) {
                                if (widget.onHover != null)
                                  widget.onHover!(index, value);
                              },
                              onTap: () async {
                                if (widget.onTap != null)
                                  widget.onTap!(context, index, e);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    e['menu'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: widget.menu[index]['hover']
                                          ? Theme.of(context).hoverColor
                                          : Theme.of(context).colorScheme.inversePrimary,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Visibility(
                                    maintainAnimation: true,
                                    maintainState: true,
                                    maintainSize: true,
                                    visible:
                                        widget.menu[index]['hover'] == true,
                                    child: Container(
                                      height: 2,
                                      width: 40,
                                      color: const Color(0xFF077BD7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 1.sw / 28),
                          ],
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
