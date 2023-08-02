export 'bloc/bloc.dart';
export 'ui/ui.dart';

import 'auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AuthFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: AuthLoginScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthLoginScreen();
        },
      ),
    ];
  }

  static Future<void> initInjection() async {
    final inject = GetIt.instance;

    ///BLOC
    inject.registerFactory(() => AuthBloc());
    inject.registerFactory(() => AuthLoginBloc());
  }
}
