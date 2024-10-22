class ExtraModel {
  final int? extSp;
  final String? extSrv;
  final String? extDescr;
  final int? extPrice;
  final String? pCategory;
  final int? extComm;
  final int? extTax;
  final int? progCode;
  final int? progYear;
  final String? itemRef;

  int count; // Count property

  ExtraModel({
    this.extSp,
    this.extSrv,
    this.extDescr,
    this.extPrice,
    this.pCategory,
    this.extComm,
    this.extTax,
    this.progCode,
    this.progYear,
    this.itemRef,
    this.count = 0, // Initialize count to 0
  });

  factory ExtraModel.fromJson(Map<String, dynamic> json) => ExtraModel(
    extSp: json['ext_sp'] as int?,
    extSrv: json['ext_srv'] as String?,
    extDescr: json['ext_descr'] as String?,
    extPrice: json['ext_price'] as int?,
    pCategory: json['p_category'] as String?,
    extComm: json['ext_comm'] as int?,
    extTax: json['ext_tax'] as int?,
    progCode: json['prog_code'] as int?,
    progYear: json['prog_year'] as int?,
    itemRef: json['item_ref'] as String?,
    count: json['count'] as int? ?? 0, // Handle JSON count if needed
  );

  Map<String, dynamic> toJson() => {
    'ext_sp': extSp,
    'ext_srv': extSrv,
    'ext_descr': extDescr,
    'ext_price': extPrice,
    'p_category': pCategory,
    'ext_comm': extComm,
    'ext_tax': extTax,
    'prog_code': progCode,
    'prog_year': progYear,
    'item_ref': itemRef,
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