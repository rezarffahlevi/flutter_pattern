import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/themes/my_color.dart';

class HomeDrawer extends StatefulWidget {
  List<dynamic> menu = [];
  Function(BuildContext context, int index, dynamic data)? onTap;
  HomeDrawer({super.key, required this.menu, this.onTap});

  @override
  State<StatefulWidget> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: null,
                  child: Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'Nama User',
                  style: TextStyle(fontSize: 21, color: Colors.white70),
                )
              ],
            ),
            const SizedBox(height: 20),
            if (widget.menu.isNotEmpty)
              ...widget.menu.map((e) {
                final index = widget.menu
                    .indexWhere((element) => element['menu'] == e['menu']);
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.w, horizontal: 10.w),
                  child: InkWell(
                    onTap: () async {
                      if (widget.onTap != null)
                        widget.onTap!(context, index, e);
                    },
                    child: Text(
                      e['menu'],
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                );
              }),

            //footer
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Copyright © 2020 | EXPLORE',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).cardColor),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
