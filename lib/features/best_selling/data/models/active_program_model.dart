class ActiveProgramModel {
  final int code;
  final String programName;
  final int programYear;
  final double? startPrice;
  final String imgPath;
  final String rateReview;

  ActiveProgramModel({
    required this.code,
    required this.programName,
    required this.programYear,
    this.startPrice,
    required this.imgPath,
    required this.rateReview,
  });

  factory ActiveProgramModel.fromJson(Map<String, dynamic> json) {
    return ActiveProgramModel(
      code: json['code'],
      programName: json['programname'],
      programYear: json['programyear'],
      startPrice: json['startprice'] ?? 0,
      imgPath: json['img_path'],
      rateReview: json['rate_review'],
    );
  }
}
