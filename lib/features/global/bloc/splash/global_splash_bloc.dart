
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/features/features.dart';

class GlobalSplashBloc extends Cubit<GlobalSplashState> {

  GlobalSplashBloc() : super(GlobalSplashState());

  init(BuildContext context){
    Timer(const Duration(seconds: 3), () { 
      GoRouter.of(context).go(AuthLoginScreen.routeName);
    });
  }

}