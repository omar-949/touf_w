import 'package:dio/dio.dart';

class SignUpRequest {
  final String phone;
  final String email;
  final String userName;
  final String password;
  final String nat;
  final String address;

  SignUpRequest({
    required this.phone,
    required this.email,
    required this.userName,
    required this.password,
    required this.nat,
    required this.address,
  });

  // Convert to JSON
  FormData toJson() {
    return FormData.fromMap({
      'CNAME': userName,
      'NAT': nat,
      'TEL': phone, // Maps to phone
      'C_PASS': password, // Maps to password
      'p_Mail': email, // Maps to email
      'C_ADDRESS': address // Maps to address
    });
  }
}
