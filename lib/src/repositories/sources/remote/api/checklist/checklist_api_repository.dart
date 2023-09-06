import 'package:temanbumil_web/src/repositories/models/checklist/checklist_check_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/checklist/checklist_list_response_model.dart';
import 'package:temanbumil_web/src/repositories/models/fetus/list_fetus_response_model.dart';

abstract class ChecklistApiRepository {
  Future<ChecklistListResponseModel> getChecklistList({
    int? fetusId,
    String? week,
    String? weekUnit,
    bool? milestone,
  });

  Future<ChecklistCheckResponseModel> checklistCheck({
    int? fetusId,
    String? checkId,
    String? checklistId,
  });

  Future<ListFetusResponseModel> getListFetus({
    String? fetusId,
    bool? homepage,
  });
}
