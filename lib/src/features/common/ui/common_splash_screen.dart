import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/themes/themes.dart';

class CommonSplashScreen extends StatefulWidget {
  const CommonSplashScreen({super.key});
  static const String routeName = '/';

  @override
  State<CommonSplashScreen> createState() => _CommonSplashScreenState();
}

class _CommonSplashScreenState extends State<CommonSplashScreen> {
  final bloc = inject<GlobalSplashBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyAsset.logoWhite, height: 80.h),
            // Text('welcome_tb').tr(),
          ],
        ),
      ),
    );
  }
}
