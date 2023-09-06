import 'package:temanbumil_web/src/repositories/models/tips/tips_model.dart';
import 'package:temanbumil_web/src/repositories/repositories.dart';

class TipsDetailResponseModel {
  int? status;
  bool? acknowledge;
  Data? data;
  InfoModel? info;

  TipsDetailResponseModel({this.status, this.acknowledge, this.data, this.info});

  TipsDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
    data['info'] = this.info;
    return data;
  }

  static Map<String, dynamic> generateParams(String? tipsId) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tips_id'] = tipsId;
    return data;
  }
}

class Data {
  int? tipsId;
  int? week;
  String? title;
  String? description;
  String? cover;
  String? published;
  String? weekCategory;
  String? weekUnit;
  int? viewed;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;
  String? temporaryTag;
  Null slotAdsId;
  List<TipsModel>? relatedTips;
  bool? bookmark;

  Data(
      {this.tipsId,
      this.week,
      this.title,
      this.description,
      this.cover,
      this.published,
      this.weekCategory,
      this.weekUnit,
      this.viewed,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.temporaryTag,
      this.slotAdsId,
      this.relatedTips,
      this.bookmark});

  Data.fromJson(Map<String, dynamic> json) {
    tipsId = json['tips_id'];
    week = json['week'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    published = json['published'];
    weekCategory = json['week_category'];
    weekUnit = json['week_unit'];
    viewed = json['viewed'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    temporaryTag = json['temporary_tag'];
    slotAdsId = json['slot_ads_id'];
    if (json['related_tips'] != null) {
      relatedTips = [];
      json['related_tips'].forEach((v) {
        relatedTips!.add(new TipsModel.fromJson(v));
      });
    }
    bookmark = json['bookmark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tips_id'] = this.tipsId;
    data['week'] = this.week;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover'] = this.cover;
    data['published'] = this.published;
    data['week_category'] = this.weekCategory;
    data['week_unit'] = this.weekUnit;
    data['viewed'] = this.viewed;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['temporary_tag'] = this.temporaryTag;
    data['slot_ads_id'] = this.slotAdsId;
    if (this.relatedTips != null) {
      data['related_tips'] = this.relatedTips!.map((v) => v.toJson()).toList();
    }
    data['bookmark'] = this.bookmark;
    return data;
  }
}
