class TipsSubCategoryModel {
  int? subCategoryId;
  int? categoryId;
  String? title;
  String? description;
  String? icon;
  String? published;
  int? ordered;
  String? tags;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;

  TipsSubCategoryModel(
      {this.subCategoryId,
      this.categoryId,
      this.title,
      this.description,
      this.icon,
      this.published,
      this.ordered,
      this.tags,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy});

  TipsSubCategoryModel.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    published = json['published'];
    ordered = json['ordered'];
    tags = json['tags'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['published'] = this.published;
    data['ordered'] = this.ordered;
    data['tags'] = this.tags;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
