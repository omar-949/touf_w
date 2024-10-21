class ValidateEmailForForgetPasswordResponse {
  int? transactionNo;
  String? otp;

  ValidateEmailForForgetPasswordResponse({this.transactionNo, this.otp});

  factory ValidateEmailForForgetPasswordResponse.fromJson(
      Map<String, dynamic> json) {
    return ValidateEmailForForgetPasswordResponse(
      transactionNo: json['TransactionNo'] as int?,
      otp: json['OTP'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'TransactionNo': transactionNo,
        'OTP': otp,
      };
}
