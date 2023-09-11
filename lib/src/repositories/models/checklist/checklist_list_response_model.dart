import '../../repositories.dart';

class ChecklistListResponseModel {
  int? status;
  bool? acknowledge;
  ChecklistListModel? data;
  InfoModel? info;

  ChecklistListResponseModel(
      {this.status, this.info, this.data, this.acknowledge});

  ChecklistListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    data = json['data'] != null
        ? new ChecklistListModel.fromJson(json['data'])
        : null;

    info = json['info'] != null ? new InfoModel.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> generateParams(
      int? fetusId, String? week, String? weekUnit, bool? milestone) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fetusId'] = fetusId;
    data['week'] = week;
    data['week_unit'] = weekUnit;
    data['milestone'] = milestone;
    return data;
  }

  static Map<String, dynamic> aquaGenerateParams(int? fetusId) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fetusId'] = fetusId;
    return data;
  }
}

class ChecklistListModel {
  List<ChecklistItemModel>? checklist;
  List<String>? checkIds;
  List<int>? checked;
  int? countChecklist;
  int? countChecked;
  double? percentage;

  //KEBUTUHAN AQUA
  int? fetusId;

  ChecklistListModel(
      {this.checklist,
      this.countChecklist,
      this.countChecked,
      this.percentage,
      this.fetusId});

  ChecklistListModel.fromJson(Map<String, dynamic> json) {
    checkIds = json['check_ids'].cast<String>();
    checked = json['checked'].cast<int>();
    if (json['checklist'] != null) {
      checklist = [];
      json['checklist'].forEach((v) {
        checklist!.add(new ChecklistItemModel.fromJson(v, checked));
      });
    }
    countChecklist = checkIds!.length;
    countChecked = checked!.length;
    percentage = countChecked! / countChecklist! * 100;
    fetusId = json['fetus_id'];
//    percentage = double.parse((json['percentage'] ?? 0).toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checklist != null) {
      data['checklist'] = this.checklist!.map((v) => v.toJson()).toList();
    }
    data['check_ids'] = this.checkIds;
    data['checked'] = this.checked;
    data['count_checklist'] = this.countChecklist;
    data['percentage'] = this.percentage;
    data['fetus_id'] = this.fetusId;
    return data;
  }
}

class ChecklistItemModel {
  String? checklistId;
  String? week;
  String? title;
  String? information;
  String? published;
  String? weekCategory;
  String? weekUnit;
  String? ordered;
  String? created;
  String? updated;
  String? createdBy;
  String? updatedBy;
  String? color;
  List<ChecklistNode>? checklistNode;

  ChecklistItemModel(
      {this.checklistId,
      this.week,
      this.title,
      this.information,
      this.published,
      this.weekCategory,
      this.weekUnit,
      this.ordered,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.color,
      this.checklistNode});

  ChecklistItemModel.fromJson(Map<String, dynamic> json, List<int>? checked) {
    checklistId = json['checklist_id'];
    week = json['week'];
    title = json['title'];
    information = json['information'];
    published = json['published'];
    weekCategory = json['week_category'];
    weekUnit = json['week_unit'];
    ordered = json['ordered'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    color = json['color'];
    if (json['checklist_node'] != null) {
      checklistNode = [];
      json['checklist_node'].forEach((v) {
        checklistNode!.add(new ChecklistNode.fromJson(v, checked!));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checklist_id'] = this.checklistId;
    data['week'] = this.week;
    data['title'] = this.title;
    data['information'] = this.information;
    data['published'] = this.published;
    data['week_category'] = this.weekCategory;
    data['week_unit'] = this.weekUnit;
    data['ordered'] = this.ordered;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['color'] = this.color;
    if (this.checklistNode != null) {
      data['checklist_node'] =
          this.checklistNode!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChecklistNode {
  String? checkId;
  String? checklistId;
  String? description;
  String? ordered;
  String? urlAds;
  String? created;
  String? updated;
  String? createdBy;
  String? updatedBy;
  String? nodeId;
  bool? checked;

  ChecklistNode(
      {this.checkId,
      this.checklistId,
      this.description,
      this.ordered,
      this.urlAds,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.nodeId,
      this.checked});

  ChecklistNode.fromJson(Map<String, dynamic> json, List<int> checked) {
    checkId = json['check_id'];
    checklistId = json['checklist_id'];
    description = json['description'];
    ordered = json['ordered'];
    urlAds = json['url_ads'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    nodeId = json['node_id'];
    //    checked = json['checked'];
    this.checked = checked.contains(int.parse(checkId!));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_id'] = this.checkId;
    data['checklist_id'] = this.checklistId;
    data['description'] = this.description;
    data['ordered'] = this.ordered;
    data['url_ads'] = this.urlAds;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['node_id'] = this.nodeId;
    data['checked'] = this.checked;
    return data;
  }
}
