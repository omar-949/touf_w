class ApiEndpoints {
  static const String baseUrl = 'http://app.misrtravelco.net:4444/ords/invoice/programes/';
  static const String signUp = 'client/';

  static String login({required String email, required String password}) {
    return 'ClientLogin/$email/$password';
  }
}
