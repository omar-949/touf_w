class ReviewRequest {
  final int cust;
  final String rate;
  final String review;

  ReviewRequest({required this.review, required this.rate, required this.cust});

  Map<String, dynamic> toJson() => {
        'cust': cust,
        'rate': rate,
        'review': review,
      };
}
