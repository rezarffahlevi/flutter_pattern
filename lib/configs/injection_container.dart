import 'package:get_it/get_it.dart';
import 'package:temanbumil_web/features/features.dart';

final inject = GetIt.instance;
Future<void> injectionContainer() async {
  GlobalFeature.initInjection();
  AuthFeature.initInjection();
}
