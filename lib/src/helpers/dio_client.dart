import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/configs/configs.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class DioClient {
  String baseUrl = getBaseUrl();

  DioClient();

  Dio get dio => _getDio();

  static String getBaseUrl() {
    return Config.baseUrl;
  }

  static Duration? _getTimeOutDuration() {
    return Config.timeOutDuration;
  }

  Dio _getDio({String? baseUrlCustom}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlCustom ?? baseUrl,
      connectTimeout: _getTimeOutDuration(),
      receiveTimeout: _getTimeOutDuration(),
    );

    Dio dio = Dio(options);
    dio.interceptors.addAll([
      _interceptor(),
    ]);
    return dio;
  }

  setHeader(RequestOptions options) async {
    // String jwtToken = await Prefs.jwtToken;
    // if (jwtToken == '') jwtToken = 'ERROR';

    // options.headers["Authorization"] = jwtToken;
    options.headers["DeviceID"] = '1234567890';
    options.headers["PushToken"] = 'AAAAAAAAAAAA';
    options.headers["Authorization"] = 'Basic JDJhJDExJDAydUhjN0dacDJRUUhaSm8zMTIxUU9adXpDeURBTlpYdDZjUXdNUGJqL1kvdnVZanNYLzlHOmFycnVZMXMzUzNKTXdja1l5TGtKV01CaVZUV3JGZGpSMnRXN09qWEVzTXltVkRDVUpP';
    options.headers["MobileSession"] = 'GDJdpFyi9Aegm.7/cn./Ij//TY8YUU1MspesHkOOS2LIG';
    options.headers["user-agent"] = 'PostmanRuntime/7.32.3';
    options.headers["PackageName"] = 'com.temanbumil.android';
    options.headers["PackageVersion"] = '1.0.0';
    options.headers["PackageVersionNumber"] = 12;
    options.headers["Content-Type"] = "application/json";
    options.headers["MobileDevice"] = 'android';
    options.headers["ApiVersion"] = '2.0';
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        await setHeader(options);
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        logger.i('ResponseLog ${response.requestOptions.method} ${response.realUri} \n'
            '-- headers --\n'
            '${tryEncode(response.requestOptions.headers)} \n'
            '-- queryParameters --\n'
            '${tryEncode(response.requestOptions.queryParameters)} \n'
            '-- data --\n'
            '${tryEncode(response.requestOptions.data ?? '').replaceAll('\\"', '"')} \n'
            '-- payload --\n'
            '${tryEncode(response.data)} \n'
            '');
        return handler.next(response); // continue
      },
      onError: (DioException err, handler) async {
        final options = err.requestOptions;

        logger.e('\n'
            'ResponseLog Error ${options.method} ${options.uri} --> $err \n'
            '-- headers --\n'
            '${tryEncode(options.headers)} \n'
            '-- queryParameters --\n'
            '${tryEncode(options.queryParameters)} \n'
            '-- data --\n'
            '${options.data ?? ''} \n'
            '-- payload --\n'
            '${tryEncode(err.response?.data ?? '')} \n'
            '');

        return handler.reject(err);
      },
    );
  }

  String tryEncode(data) {
    try {
      String jsonString = json.encode(data);
      // var object = json.decode(jsonString);
      // var prettyString = JsonEncoder.withIndent('  ').convert(object);
      return jsonString;
    } catch (e) {
      return '-';
    }
  }
}
