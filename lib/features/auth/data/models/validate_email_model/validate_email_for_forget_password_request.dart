import 'package:dio/dio.dart';

class ValidateEmailForForgetPasswordRequest {
  final String email;
  final String otpCode;

  ValidateEmailForForgetPasswordRequest(
      {required this.email, required this.otpCode});

  FormData toJson() {
    return FormData.fromMap({
      'V_OTP': otpCode,
    });
  }
}
