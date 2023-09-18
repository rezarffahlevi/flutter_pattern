class WeekModel {
  String? title;
  String? week;
  String? weekUnit;

  WeekModel({this.title, this.week, this.weekUnit});

  WeekModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    week = json['week'];
    weekUnit = json['week_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['week'] = this.week;
    data['week_unit'] = this.weekUnit;
    return data;
  }
}
