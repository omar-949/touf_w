class ExtraModel {
  int? extSp;
  String? extSrv;
  String? extDescr;
  int? extPrice;
  String? pCategory;
  int? extComm;
  int? extTax;
  int? progCode;
  int? progYear;
  String? itemRef;

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
      };
}
