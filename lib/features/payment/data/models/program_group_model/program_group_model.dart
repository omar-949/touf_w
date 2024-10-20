class ProgramGroupModel {
  String? paxType;
  int? pPrice;
  int? progGrpNo;
  String? progGrpFrom;

  ProgramGroupModel({
    this.paxType,
    this.pPrice,
    this.progGrpNo,
    this.progGrpFrom,
  });

  factory ProgramGroupModel.fromJson(Map<String, dynamic> json) => ProgramGroupModel(
        paxType: json['pax_type'] as String?,
        pPrice: json['p_price'] as int?,
        progGrpNo: json['prog_grp_no'] as int?,
        progGrpFrom: json['prog_grp_from'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pax_type': paxType,
        'p_price': pPrice,
        'prog_grp_no': progGrpNo,
        'prog_grp_from': progGrpFrom,
      };
}
