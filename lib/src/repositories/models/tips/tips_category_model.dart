
import 'package:temanbumil_web/src/repositories/models/tips/tips_sub_category_model.dart';

class TipsCategoryModel {
  String? title;
  String? weekCategory;
  List<TipsSubCategoryModel>? subCategory;

  TipsCategoryModel({this.title, this.weekCategory, this.subCategory});

  TipsCategoryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    weekCategory = json['week_category'];
    if (json['sub_category'] != null) {
      subCategory = [];
      json['sub_category'].forEach((v) {
        subCategory!.add(new TipsSubCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['week_category'] = this.weekCategory;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
