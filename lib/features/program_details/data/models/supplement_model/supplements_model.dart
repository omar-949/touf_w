class SupplementsModel {
  String? code;
  String? thePriceIncludesSupplement;

  SupplementsModel({this.code, this.thePriceIncludesSupplement});

  factory SupplementsModel.fromJson(Map<String, dynamic> json) {
    return SupplementsModel(
      code: json['code'] as String?,
      thePriceIncludesSupplement:
          json['the price includes supplement'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'the price includes supplement': thePriceIncludesSupplement,
      };
}
