class DetailsActiveProgramModel {
  final int? progcode;
  final String? programName;
  final int? programYear;
  final int? startPrice;
  final String? startDate;
  final String? endDate;
  final int? day;
  final String? classTrip;
  final String? city;
  final String? overView;

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
      startPrice: json['StartPrice'] ?? 0 as int?,
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
