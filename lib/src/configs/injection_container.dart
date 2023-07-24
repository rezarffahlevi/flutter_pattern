import 'package:get_it/get_it.dart';
import 'package:temanbumil_web/src/features/features.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';
import 'package:temanbumil_web/src/repositories/sources/api/api.dart';

final inject = GetIt.instance;
Future<void> initInjection() async {
  // BLoC
  CommonFeature.initInjection();
  AuthFeature.initInjection();
  HomeFeature.initInjection();

  // Repository
  ApiSources.initInjection();

  // Network
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => DioClient());
  
}
