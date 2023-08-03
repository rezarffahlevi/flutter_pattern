

import 'package:temanbumil_web/src/repositories/models/article/article_model.dart';
import 'package:temanbumil_web/src/repositories/models/models.dart';

class ArticleListResponseModel {
  int? status;
  bool? acknowledge;
  Data? data;
  InfoModel? info;

  ArticleListResponseModel({this.status, this.acknowledge, this.data, this.info});

  ArticleListResponseModel.fromJson(Map<String, dynamic> json) {
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

  static Map<String, dynamic> generateParams(
      String? keyword, int? page, String? categoryId, bool? bookmark, String? subCategoryIds) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keyword'] = keyword;
    data['page'] = page;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryIds;
    data['bookmark'] = bookmark;
    return data;
  }
}

class Data {
  int? queryTotal;
  int? currentPage;
  int? totalPage;
  List<ArticleModel>? article;
  bool? searchNotFound;

  Data({this.queryTotal, this.currentPage, this.totalPage, this.article, this.searchNotFound});

  Data.fromJson(Map<String, dynamic> json) {
    queryTotal = json['query_total'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    if (json['data'] != null) {
      article = [];
      json['data'].forEach((v) {
        article!.add(new ArticleModel.fromJson(v));
      });
    }
    searchNotFound = json['search_not_found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query_total'] = this.queryTotal;
    data['current_page'] = this.currentPage;
    data['total_page'] = this.totalPage;
    if (this.article != null) {
      data['data'] = this.article!.map((v) => v.toJson()).toList();
    }
    data['search_not_found'] = this.searchNotFound;
    return data;
  }
}
