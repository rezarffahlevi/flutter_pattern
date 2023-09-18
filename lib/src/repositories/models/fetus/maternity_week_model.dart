import 'package:temanbumil_web/src/repositories/models/fetus/week_model.dart';

class MaternityWeekModel {
  List<WeekModel>? data;

  MaternityWeekModel({this.data});

  MaternityWeekModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new WeekModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
