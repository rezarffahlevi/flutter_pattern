import 'package:go_router/go_router.dart';
import 'package:temanbumil_web/src/features/features.dart';

class Routes {
  static appRoutes() {
    return GoRouter(
      routes: [
        ...CommonFeature.appRoutes(),
        ...AuthFeature.appRoutes(),
      ],
    );
  }
}
