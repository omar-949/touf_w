class TourIncludingModel {
  final String? programName;
  final String? tourIncludin;

  TourIncludingModel({this.programName, this.tourIncludin});

  factory TourIncludingModel.fromJson(Map<String, dynamic> json) {
    return TourIncludingModel(
      programName: json['programName'] as String?,
      tourIncludin: json['TourIncludin'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'programName': programName,
        'TourIncludin': tourIncludin,
      };
}
