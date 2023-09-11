import '../../repositories.dart';

class ChecklistCheckResponseModel {
  int? status;
  bool? acknowledge;
  Data? data;
  InfoModel? info;

  ChecklistCheckResponseModel(
      {this.status, this.acknowledge, this.data, this.info});

  ChecklistCheckResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    info = json['info'] != null ? new InfoModel.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> generateParams(
      int? fetusId, String? checkId, String? checklistId) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fetus_id'] = fetusId;
    data['check_id'] = checkId;
    data['checklist_id'] = checklistId;
    return data;
  }
}

class Data {
  int? fieldCount;
  int? affectedRows;
  int? insertId;
  int? serverStatus;
  int? warningCount;
  String? message;
  bool? protocol41;
  int? changedRows;

  Data(
      {this.fieldCount,
      this.affectedRows,
      this.insertId,
      this.serverStatus,
      this.warningCount,
      this.message,
      this.protocol41,
      this.changedRows});

  Data.fromJson(Map<String, dynamic> json) {
    fieldCount = json['fieldCount'];
    affectedRows = json['affectedRows'];
    insertId = json['insertId'];
    serverStatus = json['serverStatus'];
    warningCount = json['warningCount'];
    message = json['message'];
    protocol41 = json['protocol41'];
    changedRows = json['changedRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldCount'] = this.fieldCount;
    data['affectedRows'] = this.affectedRows;
    data['insertId'] = this.insertId;
    data['serverStatus'] = this.serverStatus;
    data['warningCount'] = this.warningCount;
    data['message'] = this.message;
    data['protocol41'] = this.protocol41;
    data['changedRows'] = this.changedRows;
    return data;
  }
}
