import '../../repositories.dart';

class TipsListResponseModel {
  int? status;
  bool? acknowledge;
  Data? data;
  InfoModel? info;

  TipsListResponseModel({this.status, this.acknowledge, this.data, this.info});

  TipsListResponseModel.fromJson(Map<String, dynamic> json) {
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
      String? subCategoryId, String? keyword, bool? bookmark, int? page) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = subCategoryId;
    data['keyword'] = keyword;
    data['bookmark'] = bookmark;
    data['page'] = page;
    return data;
  }
}

class Data {
  int? queryTotal;
  int? currentPage;
  int? totalPage;
  List<TipsModel>? tips;
  bool? searchNotFound;

  Data(
      {this.queryTotal,
      this.currentPage,
      this.totalPage,
      this.tips,
      this.searchNotFound});

  Data.fromJson(Map<String, dynamic> json) {
    queryTotal = json['query_total'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    if (json['data'] != null) {
      tips = [];
      json['data'].forEach((v) {
        tips!.add(new TipsModel.fromJson(v));
      });
    }
    searchNotFound = json['search_not_found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query_total'] = this.queryTotal;
    data['current_page'] = this.currentPage;
    data['total_page'] = this.totalPage;
    if (this.tips != null) {
      data['data'] = this.tips!.map((v) => v.toJson()).toList();
    }
    data['search_not_found'] = this.searchNotFound;
    return data;
  }
}
