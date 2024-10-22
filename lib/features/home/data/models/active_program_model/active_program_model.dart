class ActiveProgramModel {
  int? code;
  String? programname;
  int? programyear;
  int? startprice;
  String? imgPath;
  String? rateReview;

  ActiveProgramModel({
    this.code,
    this.programname,
    this.programyear,
    this.startprice,
    this.imgPath,
    this.rateReview,
  });

  factory ActiveProgramModel.fromJson(Map<String, dynamic> json) {
    return ActiveProgramModel(
      code: json['code'] as int?,
      programname: json['programname'] as String?,
      programyear: json['programyear'] as int?,
      startprice: json['startprice'] as int?,
      imgPath: json['img_path'] as String?,
      rateReview: (json['rate_review'] != null && json['rate_review'] != 'No Review') ? json['rate_review'] as String? : '0.0',
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'programname': programname,
        'programyear': programyear,
        'startprice': startprice,
        'img_path': imgPath,
        'rate_review': rateReview,
      };
}
