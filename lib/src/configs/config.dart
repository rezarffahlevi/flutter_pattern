import 'package:temanbumil_web/src/helpers/helpers.dart';

class Config {
  // IMPORTANT! CHECK BEFORE BUILD
  static const AppEnvironmentEnum appEnvironment = AppEnvironmentEnum.STAGING;

  // static const AppEnvironmentEnum appEnvironment = AppEnvironmentEnum.PRODUCTION;

  static const String _devBuildNumber = '.1';

  static const String _baseUrl = 'https://staging-rocketchat.temanbumil.com/';
  static const String _baseUrlDev = 'https://rocketchat.temanbumil.com/';


  static String get getDevBuildNumber {
    String result = '';
    if (appEnvironment == AppEnvironmentEnum.STAGING) {
      result = _devBuildNumber;
    }
    return result;
  }

  static String get baseUrl {
    String? result;
    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        result = _baseUrlDev;
        break;
      case AppEnvironmentEnum.PRODUCTION:
        result = _baseUrl;
        break;
    }
    return result;
  }

  static Duration? get timeOutDuration {
    Duration? result;

    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        result = const Duration(seconds: 90);
        break;
      case AppEnvironmentEnum.PRODUCTION:
        result = const Duration(minutes: 3);
        break;
    }
    return result;
  }

  static String get prefix {
    String result = 'prod';
    switch (appEnvironment) {
      case AppEnvironmentEnum.STAGING:
        result = 'dev';
        break;
      case AppEnvironmentEnum.PRODUCTION:
        result = 'prod';
        break;
    }
    return result;
  }
}
