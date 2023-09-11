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
