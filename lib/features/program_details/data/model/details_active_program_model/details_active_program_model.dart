class DetailsActiveProgramModel {
  int? progcode;
  String? programName;
  int? programYear;
  int? startPrice;
  String? startDate;
  String? endDate;
  int? day;
  String? classTrip;
  String? city;
  String? overView;

  DetailsActiveProgramModel({
    this.progcode,
    this.programName,
    this.programYear,
    this.startPrice,
    this.startDate,
    this.endDate,
    this.day,
    this.classTrip,
    this.city,
    this.overView,
  });

  factory DetailsActiveProgramModel.fromJson(Map<String, dynamic> json) {
    return DetailsActiveProgramModel(
      progcode: json['PROGCODE'] as int?,
      programName: json['ProgramName'] as String?,
      programYear: json['ProgramYear'] as int?,
      startPrice: json['StartPrice'] as int?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      day: json['day'] as int?,
      classTrip: json['ClassTrip'] as String?,
      city: json['City'] as String?,
      overView: json['OverView'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'PROGCODE': progcode,
        'ProgramName': programName,
        'ProgramYear': programYear,
        'StartPrice': startPrice,
        'startDate': startDate,
        'endDate': endDate,
        'day': day,
        'ClassTrip': classTrip,
        'City': city,
        'OverView': overView,
      };
}
