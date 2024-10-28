import '../../features/auth/data/models/log_in_model/login_request.dart';

class ApiEndpoints {
  static const String baseUrl = 'http://app.misrtravelco.net:4370/ords/invoice/programes/';

  // auth
  static const String signUp = 'client/';

  static String login({required LoginRequest loginRequest}) {
    return 'ClientLogin/${loginRequest.email}/${loginRequest.password}';
  }

  static String validateEmail({required String otp}) {
    return 'validation/$otp';
  }

  static String forgetPassword({required String email}) {
    return 'forgetPassword/$email';
  }
  //--------------------------------------------------

  // home
  static String getAllActivePrograms({required int flag}) {
    return 'onlyCurrent/$flag';
  }
  //-----------------------------------------------------

  // program details
  static String getProgramDetails(
      {required final programCode, required final programYear,required final languageCode}) {
    return 'detailsesProgram/$programCode/$programYear/$languageCode';
  }

  static String getPhotoGalleryImages(
      {required final programCode, required final programYear}) {
    return 'Images/$programCode/$programYear';
  }

  static String getAllReviews(
      {required final programCode, required final programYear}) {
    return 'programReview/$programCode/$programYear';
  }

  static String getPolicy(
      {required final programCode,
      required final programYear,
      required String policyType}) {
    return 'programpolicy/$programCode/$programYear/$policyType';
  }

  static String getSupplements(
      {required final programCode, required final programYear}) {
    return 'ProgramIncluding/$programCode/$programYear';
  }

  static String getTourIncluding(
      {required final programCode, required final programYear}) {
    return 'tourincluding/$programCode/$programYear';
  }
  //-----------------------------------------------------

  // payment
  static String getExtraPrograms(
      {required final programCode, required final programYear}) {
    return 'ExtraProgram/$programCode/$programYear';
  }

  static String getProgramDateAndNumber(
      {required final programCode, required final programYear}) {
    return 'ProgramGroups/$programCode/$programYear';
  }

  static String getProgramGroup(
      {required final programCode,
      required final programYear,
      required final groupNum}) {
    return 'GroupPrice/$programCode/$programYear/$groupNum';
  }
}
