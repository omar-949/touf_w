class ReviewsModel {
  final String? review;
  final int? rate;
  final String? customer;

  ReviewsModel({this.review, this.rate, this.customer});

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        review: json['review'] as String?,
        rate: json['rate'] as int?,
        customer: json['customer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'review': review,
        'rate': rate,
        'customer': customer,
      };
}
