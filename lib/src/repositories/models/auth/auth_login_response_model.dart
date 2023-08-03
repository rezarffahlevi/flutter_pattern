import 'package:temanbumil_web/src/repositories/models/models.dart';

class AuthLoginResponseModel {
  int? status;
  bool? acknowledge;
  LoginModel? data;
  InfoModel? info;

  AuthLoginResponseModel({this.status, this.acknowledge, this.data, this.info});

  AuthLoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    data = json['data'] != null ? new LoginModel.fromJson(json['data']) : null;
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

  static Map<String, dynamic> generateParams(String? number) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = number;
    return data;
  }

  static Map<String, dynamic> generateParamsV2({
    String? number,
    String? email,
    String? password,
    String? accountId,
    String? provider,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = number;
    data['email'] = email;
    data['password'] = password;
    data['accountId'] = accountId;
    data['provider'] = provider;
    return data;
  }
}

class LoginModel {
  int? memberId;
  String? displayName;
  String? firstName;
  String? lastName;
  String? avatar;
  String? email;
  String? phoneCountryCode;
  String? phone;
  String? password;
  String? provider;
  String? gender;
  String? birthday;
  String? aboutMe;
  String? address;
  int? zipCode;
  int? professionId;
  int? cityId;
  int? ruleId;
  String? published;
  String? accountStatus;
  String? migrationStatus;
  String? newsletter;
  String? premiumAccount;
  String? verifyKey;
  String? agent;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;
  String? pushToken;
  String? mobileSession;
  String? mobileDevice;
  String? mobileId;
  int? attemptLogin;
  int? attemptForgot;
  int? attemptVerify;
  String? assignTo;
  String? syncMoengage;
  String? lastSeen;
  String? slug;
  String? ruleTitle;
  String? enabledCms;
  String? professionTitle;
  String? cityTitle;
  List<FetusModel>? fetus;
  String? subscribeTopic;
  String? newSubscribeTopic;

  LoginModel(
      {this.memberId,
      this.displayName,
      this.firstName,
      this.lastName,
      this.avatar,
      this.email,
      this.phoneCountryCode,
      this.phone,
      this.password,
      this.provider,
      this.gender,
      this.birthday,
      this.aboutMe,
      this.address,
      this.zipCode,
      this.professionId,
      this.cityId,
      this.ruleId,
      this.published,
      this.accountStatus,
      this.migrationStatus,
      this.newsletter,
      this.premiumAccount,
      this.verifyKey,
      this.agent,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.pushToken,
      this.mobileSession,
      this.mobileDevice,
      this.mobileId,
      this.attemptLogin,
      this.attemptForgot,
      this.attemptVerify,
      this.assignTo,
      this.syncMoengage,
      this.lastSeen,
      this.slug,
      this.ruleTitle,
      this.enabledCms,
      this.professionTitle,
      this.cityTitle,
      this.fetus,
      this.subscribeTopic,
      this.newSubscribeTopic});

  LoginModel.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    displayName = json['display_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    email = json['email'];
    phoneCountryCode = json['phone_country_code'];
    phone = json['phone'];
    password = json['password'];
    provider = json['provider'];
    gender = json['gender'];
    birthday = json['birthday'];
    aboutMe = json['about_me'];
    address = json['address'];
    zipCode = json['zip_code'];
    professionId = json['profession_id'];
    cityId = json['city_id'];
    ruleId = json['rule_id'];
    published = json['published'];
    accountStatus = json['account_status'];
    migrationStatus = json['migration_status'];
    newsletter = json['newsletter'];
    premiumAccount = json['premium_account'];
    verifyKey = json['verify_key'];
    agent = json['agent'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    pushToken = json['push_token'];
    mobileSession = json['mobile_session'];
    mobileDevice = json['mobile_device'];
    mobileId = json['mobile_id'];
    attemptLogin = json['attempt_login'];
    attemptForgot = json['attempt_forgot'];
    attemptVerify = json['attempt_verify'];
    assignTo = json['assign_to'];
    syncMoengage = json['sync_moengage'];
    lastSeen = json['last_seen'];
    slug = json['slug'];
    ruleTitle = json['rule_title'];
    enabledCms = json['enabled_cms'];
    professionTitle = json['profession_title'];
    cityTitle = json['city_title'];
    if (json['fetus'] != null) {
      fetus = [];
      json['fetus'].forEach((v) {
        fetus!.add(new FetusModel.fromJson(v));
      });
    }
    subscribeTopic = json['subscribe_topic'];
    newSubscribeTopic = json['new_subscribe_topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['display_name'] = this.displayName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['phone_country_code'] = this.phoneCountryCode;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['provider'] = this.provider;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['about_me'] = this.aboutMe;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    data['profession_id'] = this.professionId;
    data['city_id'] = this.cityId;
    data['rule_id'] = this.ruleId;
    data['published'] = this.published;
    data['account_status'] = this.accountStatus;
    data['migration_status'] = this.migrationStatus;
    data['newsletter'] = this.newsletter;
    data['premium_account'] = this.premiumAccount;
    data['verify_key'] = this.verifyKey;
    data['agent'] = this.agent;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['push_token'] = this.pushToken;
    data['mobile_session'] = this.mobileSession;
    data['mobile_device'] = this.mobileDevice;
    data['mobile_id'] = this.mobileId;
    data['attempt_login'] = this.attemptLogin;
    data['attempt_forgot'] = this.attemptForgot;
    data['attempt_verify'] = this.attemptVerify;
    data['assign_to'] = this.assignTo;
    data['sync_moengage'] = this.syncMoengage;
    data['last_seen'] = this.lastSeen;
    data['slug'] = this.slug;
    data['rule_title'] = this.ruleTitle;
    data['enabled_cms'] = this.enabledCms;
    data['profession_title'] = this.professionTitle;
    data['city_title'] = this.cityTitle;
    if (this.fetus != null) {
      data['fetus'] = this.fetus!.map((v) => v.toJson()).toList();
    }
    data['subscribe_topic'] = this.subscribeTopic;
    data['new_subscribe_topic'] = this.newSubscribeTopic;
    return data;
  }
}

class FetusModel {
  int? fetusId;
  String? fullname;
  String? lastMenstrual;
  String? bornDate;
  String? gender;
  String? couple;
  String? status;
  String? avatar;
  double? motherWeight;
  String? deleted;
  String? created;
  String? updated;
  int? createdBy;
  int? updatedBy;
  String? agent;
  String? maternityToBorn;
  String? age; // di fetus profil gada age
  double? weight; //edited int to double
  double? height; //edited int to double
  double? headCircumference; //edited int to double
  double? firstWeight; //edited int to double
  double? firstHeight; //edited int to double
  double? firstHeadCircumference; //edited int to double
  int? ageWeek;
  int? currentWeek;
  String? weekUnit;
  String? cover3DDetail;
  double? agePercentage;
  String? progressDescription;

  FetusModel(
      {this.fetusId,
      this.fullname,
      this.lastMenstrual,
      this.bornDate,
      this.gender,
      this.couple,
      this.status,
      this.avatar,
      this.motherWeight,
      this.deleted,
      this.created,
      this.updated,
      this.createdBy,
      this.updatedBy,
      this.agent,
      this.maternityToBorn,
      this.age,
      this.weight,
      this.height,
      this.headCircumference,
      this.firstWeight,
      this.firstHeight,
      this.firstHeadCircumference,
      this.ageWeek,
      this.currentWeek,
      this.weekUnit,
      this.cover3DDetail,
      this.agePercentage,
      this.progressDescription});

  FetusModel.fromJson(Map<String, dynamic> json) {
    fetusId = json['fetus_id'];
    fullname = json['fullname'];
    lastMenstrual = json['last_menstrual'];
    bornDate = json['born_date'];
    gender = json['gender'];
    couple = json['couple'];
    status = json['status'];
    avatar = json['avatar'];
    motherWeight = double.parse(json['mother_weight'].toString());
    deleted = json['deleted'];
    created = json['created'];
    updated = json['updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    agent = json['agent'];
    maternityToBorn = json['maternity_to_born'];
    ageWeek = json['age_week'];
    age = json['age'];
    weight = double.tryParse(
        json['weight'].toString().replaceAll(',', '.') ?? '0.0');
    height = double.tryParse(
        json['height'].toString().replaceAll(',', '.') ?? '0.0');
    headCircumference = double.tryParse(
        json['head_circumference'].toString().replaceAll(',', '.') ?? '0.0');
    firstWeight = double.tryParse(
        json['first_weight'].toString().replaceAll(',', '.') ?? '0.0');
    firstHeight = double.tryParse(
        json['first_height'].toString().replaceAll(',', '.') ?? '0.0');
    firstHeadCircumference = double.tryParse(
        json['first_head_circumference'].toString().replaceAll(',', '.') ??
            '0.0');
    currentWeek = json['current_week'];
    weekUnit = json['week_unit'];
    cover3DDetail = json['cover_3d_detail'];
    progressDescription = json['progress_description'];
    agePercentage = double.tryParse(
        json['age_percentage'].toString().replaceAll(',', '.') ?? '0.0');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fetus_id'] = this.fetusId;
    data['fullname'] = this.fullname;
    data['last_menstrual'] = this.lastMenstrual;
    data['born_date'] = this.bornDate;
    data['gender'] = this.gender;
    data['couple'] = this.couple;
    data['status'] = this.status;
    data['avatar'] = this.avatar;
    data['mother_weight'] = this.motherWeight;
    data['deleted'] = this.deleted;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['agent'] = this.agent;
    data['maternity_to_born'] = this.maternityToBorn;
    data['age_week'] = this.ageWeek;
    data['age'] = this.age;
    data['weight'] =
        double.tryParse(this.weight.toString().replaceAll(',', '.') ?? '0.0');
    data['height'] =
        double.tryParse(this.height.toString().replaceAll(',', '.') ?? '0.0');
    data['head_circumference'] = double.tryParse(
        this.headCircumference.toString().replaceAll(',', '.') ?? '0.0');
    data['first_weight'] = double.tryParse(
        this.firstWeight.toString().replaceAll(',', '.') ?? '0.0');
    data['first_height'] = double.tryParse(
        this.firstHeight.toString().replaceAll(',', '.') ?? '0.0');
    data['first_head_circumference'] = double.tryParse(
        this.firstHeadCircumference.toString().replaceAll(',', '.') ?? '0.0');
    data['current_week'] = this.currentWeek;
    data['week_unit'] = this.weekUnit;
    data['cover_3d_detail'] = this.cover3DDetail;
    data['age_precentage'] = this.agePercentage;
    data['progress_description'] = this.progressDescription;
    return data;
  }
}
