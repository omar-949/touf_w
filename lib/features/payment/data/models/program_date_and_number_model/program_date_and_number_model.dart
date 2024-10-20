class ProgramDateAndNumberModel {
  int? progGrpNo;
  String? progGrpFrom;
  int? paxAval;

  ProgramDateAndNumberModel({this.progGrpNo, this.progGrpFrom, this.paxAval});

  factory ProgramDateAndNumberModel.fromJson(Map<String, dynamic> json) {
    return ProgramDateAndNumberModel(
      progGrpNo: json['prog_grp_no'] as int?,
      progGrpFrom: json['prog_grp_from'] as String?,
      paxAval: json['pax_aval'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'prog_grp_no': progGrpNo,
        'prog_grp_from': progGrpFrom,
        'pax_aval': paxAval,
      };
}
