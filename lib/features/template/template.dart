export 'ui/ui.dart';

import 'template.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class GlobalFeature {
  static List appRoutes() {
    return [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GlobalSplashScreen();
        },
      ),
    ];
  }

  final inject = GetIt.instance;
  static Future<void> initInjection() async {
    ///BLOC
    // inject.registerFactory(() => HomeBloc());

    //REPOSITORY
    // inject.registerLazySingleton<TemplateRepository>(() => TemplateApiRepository(dio: inject()));
  }
}
