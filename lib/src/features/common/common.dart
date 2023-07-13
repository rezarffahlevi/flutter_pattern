export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CommonFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: GlobalSplashScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const GlobalSplashScreen();
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => GlobalSplashBloc());
  }
}
