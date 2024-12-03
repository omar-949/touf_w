class SupplementsModel {
  String? code;
  String? thePriceIncludesSupplement;

  SupplementsModel({this.code, this.thePriceIncludesSupplement});

  factory SupplementsModel.fromJson(Map<String, dynamic> json) {
    return SupplementsModel(
      code: json['code'] as String?,
      thePriceIncludesSupplement: json['the_price_includes_supplement'] as String?,
    );
  }
}
