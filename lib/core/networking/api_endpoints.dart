import '../../features/auth/data/models/log_in_model/login_request.dart';

class ApiEndpoints {
  static const String baseUrl = 'http://app.misrtravelco.net:4444/ords/invoice/programes/';
  static const String signUp = 'client/';
  static String login({required LoginRequest loginRequest}){
    return 'ClientLogin/${loginRequest.email}/${loginRequest.password}';
  }
  static String validateEmail({required String otp}) {
    return 'validation/$otp';
  }
}
