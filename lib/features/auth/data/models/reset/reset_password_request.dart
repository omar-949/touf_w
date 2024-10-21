class ResetPasswordRequest {
  final String password;
  final String otp;
  final int transNo;
  final String email;

  ResetPasswordRequest({
    required this.password,
    required this.otp,
    required this.transNo,
    required this.email,
  });

  // Convert to JSON for query parameters
  Map<String, dynamic> toJson() {
    return {
      'V_OTP': otp,        // Maps to OTP
      'TransNo': transNo,   // Maps to transaction number
      'pass': password,     // Maps to password
    };
  }
}
