class ReviewRequest {
  final String review;
  final double rate;
  final String cust;

  ReviewRequest({required this.review, required this.rate, required this.cust});

  Map<String, dynamic> toJson() => {
        'review': review,
        'rate': rate,
        'customer': cust,
      };
}
