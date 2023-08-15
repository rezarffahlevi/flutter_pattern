import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/components/molecules/dialog/login_dialog.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: null,
                    child: const Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Nama User',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              if (widget.menu.isNotEmpty)
                ...widget.menu.map((e) {
                  final index = widget.menu
                      .indexWhere((element) => element['menu'] == e['menu']);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 10.w),
                    child: InkWell(
                      onTap: () async {
                        if (widget.onTap != null) widget.onTap!(context, index, e);
                      },
                      child: Text(
                        e['menu'],
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  );
                }),

              // Footer
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2023 | Teman Bumil',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Theme.of(context).cardColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
