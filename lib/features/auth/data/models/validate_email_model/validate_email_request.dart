import 'package:dio/dio.dart';

class ValidateEmailRequest {
  final String email;
  final String otpCode;
  final String phone;
  ValidateEmailRequest(
      {required this.email, required this.otpCode, required this.phone});
  FormData toJson() {
    return FormData.fromMap({
      'p_Mail': email,
      'TEL': phone,
    });
  }
}
