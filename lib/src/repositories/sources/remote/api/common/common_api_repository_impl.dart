import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class CommonApiRepositoryImpl implements CommonApiRepository {
  final Dio? dio;

  CommonApiRepositoryImpl({required this.dio});

  @override
  Future<String> test({
    String? title,
  }) async {
    return '';
  }
}
