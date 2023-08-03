class InfoModel {
  String? message;
  String? field;
  String? redirect;
  String? subMessage;

  InfoModel({this.message, this.field, this.redirect, this.subMessage});

  InfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    subMessage = json['sub_message'];
    field = json['field'].toString();
    redirect = json['redirect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sub_message'] = this.subMessage;
    data['field'] = this.field;
    data['redirect'] = this.redirect;
    return data;
  }
}
