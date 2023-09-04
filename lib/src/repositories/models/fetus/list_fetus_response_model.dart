

import 'package:temanbumil_web/src/repositories/repositories.dart';

class ListFetusResponseModel {
  int? status;
  bool? acknowledge;
  List<FetusModel>? data;
  InfoModel? info;

  ListFetusResponseModel({this.status, this.acknowledge, this.data, this.info});

  ListFetusResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new FetusModel.fromJson(v));
      });
    }
    info = json['info'] != null ? new InfoModel.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> generateParams(String? fetusId, bool? homepage) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fetus_id'] = fetusId;
    data['homepage'] = homepage;
    return data;
  }
}
