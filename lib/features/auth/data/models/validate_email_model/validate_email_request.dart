import 'package:dio/dio.dart';

class ValidateEmailRequest{
  final String email;
  final String otpCode;
  ValidateEmailRequest({required this.email,required this.otpCode});
  FormData toJson() {
    return FormData.fromMap({
      'p_Mail': email,
    });
  }
}