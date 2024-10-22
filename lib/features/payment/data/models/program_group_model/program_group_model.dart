class ProgramGroupModel {
  final String? paxType;
  final int? pPrice;
  int count;
  final int? progGrpNo;
  final String? progGrpFrom;

  ProgramGroupModel({
    this.paxType,
    this.pPrice,
    this.progGrpNo,
    this.progGrpFrom,
    this.count = 0, // Initialize count to 0
  });

  factory ProgramGroupModel.fromJson(Map<String, dynamic> json) => ProgramGroupModel(
    paxType: json['pax_type'] as String?,
    pPrice: json['p_price'] as int?,
    progGrpNo: json['prog_grp_no'] as int?,
    progGrpFrom: json['prog_grp_from'] as String?,
    count: json['count'] as int? ?? 0, // Handle JSON count if needed
  );

  Map<String, dynamic> toJson() => {
    'pax_type': paxType,
    'p_price': pPrice,
    'prog_grp_no': progGrpNo,
    'prog_grp_from': progGrpFrom,
    'count': count, // Include count in JSON
  };

  void incrementCount() {
    count++;
  }

  void decrementCount() {
    if (count > 0) {
      count--;
    }
  }
}