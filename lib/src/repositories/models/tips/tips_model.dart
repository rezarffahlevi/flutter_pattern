class TipsModel {
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
  String? slotAdsId;
  bool? bookmark;
  String? permalink;

  TipsModel(
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
      this.bookmark,
      this.permalink});

  TipsModel.fromJson(Map<String, dynamic> json) {
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
    bookmark = json['bookmark'];
    permalink = json['permalink'];
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
    data['bookmark'] = this.bookmark;
    data['permalink'] = this.permalink;
    return data;
  }
}
