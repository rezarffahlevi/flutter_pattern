import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class HomeHeaderSection extends StatefulWidget {
  final double opacity;
  const HomeHeaderSection({Key? key, required this.opacity}) : super(key: key);

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  final List<Map<String, dynamic>> _menu = [
    {'menu': 'Home', 'link': '', 'hover': false},
    {'menu': 'Tentang', 'link': '', 'hover': false},
    {'menu': 'Fitur', 'link': '', 'hover': false},
    {'menu': 'Testimoni', 'link': '', 'hover': false},
    {'menu': 'Screen', 'link': '', 'hover': false},
    {'menu': 'Media Coverage', 'link': '', 'hover': false},
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget),
                      );
                    },
                    child: Image.asset(
                      MyAsset.logoPurple,
                      height: 80.h,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(width: screenSize.width / 15),
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
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e['menu'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _menu[index]['hover']
                                        ? Theme.of(context).primaryColor
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
                          SizedBox(width: screenSize.width / 28),
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
