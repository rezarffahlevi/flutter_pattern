export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: HomeRootScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeRootScreen();
        },
      ),
      GoRoute(
        path: HomeScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => HomeRootBloc());
    inject.registerFactory(() => HomeBloc());
    inject.registerFactory(() => HomeAppBloc());
  }
}
