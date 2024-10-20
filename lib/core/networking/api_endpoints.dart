import '../../features/auth/data/models/log_in_model/login_request.dart';

class ApiEndpoints {
  static const String baseUrl =
      'http://app.misrtravelco.net:4444/ords/invoice/programes/';
  static const String signUp = 'client/';

  static String login({required LoginRequest loginRequest}) {
    return 'ClientLogin/${loginRequest.email}/${loginRequest.password}';
  }

  static String validateEmail({required String otp}) {
    return 'validation/$otp';
  }

  static String getAllActivePrograms({required int flag}) {
    return 'onlyCurrent/$flag';
  }

  static String getProgramDetails(
      {required final programCode, required final programYear}) {
    return 'detailsesProgram/$programCode/$programYear';
  }

  static String getPhotoGalleryImages(
      {required final programCode, required final programYear}) {
    return 'Images/$programCode/$programYear';
  }

  static String getAllReviews(
      {required final programCode, required final programYear}) {
    return 'Images/$programCode/$programYear';
  }

  static String getExtraPrograms(
      {required final programCode, required final programYear}) {
    return 'ExtraProgram/$programCode/$programYear';
  }
  static String getAllProgramGroups(
      {required final programCode, required final programYear}) {
    return 'ProgramGroups/$programCode/$programYear';
  }
}
