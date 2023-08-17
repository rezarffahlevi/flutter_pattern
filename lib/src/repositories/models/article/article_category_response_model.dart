
import 'package:temanbumil_web/src/repositories/models/article/article_category_model.dart';

import '../info_model.dart';

class ArticleCategoryResponseModel {
  int? status;
  bool? acknowledge;
  List<ArticleCategoryModel>? data;
  InfoModel? info;

  ArticleCategoryResponseModel({this.status, this.acknowledge, this.data, this.info});

  ArticleCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new ArticleCategoryModel.fromJson(v));
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
    data['info'] = this.info;
    return data;
  }
}
