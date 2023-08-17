class TipsBookmarkResponseModel {
  int? status;
  bool? acknowledge;
  Data? data;
  Null info;

  TipsBookmarkResponseModel({this.status, this.acknowledge, this.data, this.info});

  TipsBookmarkResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['info'] = this.info;
    return data;
  }

  static Map<String, dynamic> generateParams(String? status, String? tipsId) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['tips_id'] = tipsId;
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
