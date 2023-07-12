import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/features/features.dart';

class Routes {
  static appRoutes() {
    return GoRouter(
      routes: [
        ...GlobalFeature.appRoutes(),
        ...AuthFeature.appRoutes(),
      ],
    );
  }
}
