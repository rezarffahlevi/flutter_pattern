
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:easy_localization/easy_localization.dart';


class GlobalSplashBloc extends Cubit<GlobalSplashState> {

  GlobalSplashBloc() : super(GlobalSplashState());

  init(BuildContext context){
    Timer(const Duration(seconds: 2), () { 
      // context.setLocale(Locale('en', 'US'));
      GoRouter.of(context).go(AuthLoginScreen.routeName);
    });
  }

}