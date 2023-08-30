class ArticleCategoryModel {
  int? categoryId;
  String? title;
  String? description;
  String? icon;
  String? published;
  int? ordered;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;
  List<ArticleSubCategoryModel>? subCategory;

  ArticleCategoryModel(
      {this.categoryId,
      this.title,
      this.description,
      this.icon,
      this.published,
      this.ordered,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.subCategory});

  ArticleCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    published = json['published'];
    ordered = json['ordered'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];

    if (json['sub_category'] != null) {
      subCategory = [];
      json['sub_category'].forEach((v) {
        subCategory!.add(new ArticleSubCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['published'] = this.published;
    data['ordered'] = this.ordered;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleSubCategoryModel {
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
  bool? isShown;

  ArticleSubCategoryModel(
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
      this.updatedBy,
      this.isShown});

  ArticleSubCategoryModel.fromJson(Map<String, dynamic> json) {
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
    isShown = json['isShown'] ?? false;
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
    data['isShown'] = this.isShown;
    return data;
  }
}
