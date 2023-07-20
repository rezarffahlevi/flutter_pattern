import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/features/features.dart';

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
        child: Text('welcome_tb').tr(),
      ),
    );
  }
}
