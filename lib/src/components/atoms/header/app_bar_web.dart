import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/atoms/atoms.dart';
import 'package:temanbumil_web/src/features/home/ui/section/home_auth_dialog.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class AppBarWeb extends StatefulWidget {
  final double opacity;
  const AppBarWeb({Key? key, required this.opacity}) : super(key: key);

  @override
  State<AppBarWeb> createState() => _AppBarWebState();
}

class _AppBarWebState extends State<AppBarWeb> {
  final List<Map<String, dynamic>> _menu = [
    {'menu': 'Home', 'link': '', 'hover': false},
    {'menu': 'Tentang', 'link': '', 'hover': false},
    {'menu': 'Fitur', 'link': '', 'hover': false},
    {'menu': 'Testimoni', 'link': '', 'hover': false},
    {'menu': 'Screen', 'link': '', 'hover': false},
    {'menu': 'Login', 'link': 'login', 'hover': false},
  ];

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(1.sw, 80.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
        color: Theme.of(context).primaryColor.withOpacity(widget.opacity),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySizedBox.bloodySmallHorizontal(),
            Image.asset(MyAsset.logoWhite),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ..._menu.map(
                    (e) {
                      final index = _menu.indexWhere(
                          (element) => element['menu'] == e['menu']);
                      return Row(
                        children: [
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _menu[index]['hover'] = true
                                    : _menu[index]['hover'] = false;
                              });
                            },
                            onTap: () {
                              if (e['link'] == 'login') {
                                showDialog(
                                  context: context,
                                  builder: (context) => const HomeAuthDialog(),
                                );
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e['menu'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _menu[index]['hover']
                                        ? Theme.of(context).focusColor
                                        : Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _menu[index]['hover'] == true,
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
