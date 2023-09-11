import 'package:dio/dio.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/list_fetus_response_model.dart';
import 'package:temanbumil_web/src/repositories/sources/remote/api/checklist/checklist_api_repository.dart';
import '../../../../models/checklist/checklist_check_response_model.dart';

class ChecklistApiRepositoryImpl implements ChecklistApiRepository {
  final Dio? dio;

  ChecklistApiRepositoryImpl({required this.dio});

  @override
  Future<ChecklistListResponseModel> getChecklistList({
    int? fetusId,
    String? week,
    String? weekUnit,
    bool? milestone,
  }) async {
    try {
      final res = await dio!.post('checklist/list', data: {
        'fetus_id': fetusId,
        'week': week,
        'week_unit': weekUnit,
        'milestone': milestone,
      });
      return ChecklistListResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<ChecklistCheckResponseModel> checklistCheck({
    int? fetusId,
    String? checkId,
    String? checklistId,
  }) async {
    try {
      final res = await dio!.post('checklist/check', data: {
        'fetus_id': fetusId,
        'check_id': checkId,
        'checklist_id': checklistId,
      });
      return ChecklistCheckResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }

  @override
  Future<ListFetusResponseModel> getListFetus({
    String? fetusId,
    bool? homepage,
  }) async {
    try {
      final res = await dio!.post('member/fetus/', data: {
        'fetus_id': fetusId,
        'homepage': homepage,
      });
      return ListFetusResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.error);
    }
  }
}
