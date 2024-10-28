class ActiveProgramModel {
  final int? code;
  final String? programname;
  final int? programyear;
  final int? languageCode;
  final int? startprice;
  final String? imgPath;
  final String? rateReview;

  ActiveProgramModel({
    this.code,
    this.programname,
    this.programyear,
    this.languageCode,
    this.startprice,
    this.imgPath,
    this.rateReview,
  });

  factory ActiveProgramModel.fromJson(Map<String, dynamic> json) {
    return ActiveProgramModel(
      code: json['code'] as int?,
      programname: json['programname'] as String?,
      programyear: json['programyear'] as int?,
      languageCode: json['languagecode'] as int?,
      startprice: json['startprice'] as int?,
      imgPath: json['img_path'] as String?,
      rateReview: (json['rate_review'] != null && json['rate_review'] != 'No Review') ? json['rate_review'] as String? : '0.0',
    );
  }
}
