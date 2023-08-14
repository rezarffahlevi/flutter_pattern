import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class UserPrismaRepositoryImpl implements UserPrismaRepository {

  UserPrismaRepositoryImpl();

  @override
  Future<bool> seeder() async {
    
    return true;
  }
}
