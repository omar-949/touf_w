import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:toufwshouf/core/helpers/shared_pref_helper.dart';
import 'package:toufwshouf/core/helpers/shared_pref_keys.dart';
import 'package:toufwshouf/core/networking/dio_factory.dart';
import 'package:toufwshouf/features/auth/data/models/log_in_model/login_response.dart';
import 'package:toufwshouf/features/auth/data/models/reset/reset_password_request.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_for_forget_password_request.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_for_forget_password_response.dart';
import 'package:toufwshouf/main.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../../../../core/networking/api_service.dart';
import '../../models/log_in_model/login_request.dart';
import '../../models/sign_up_model/sign_up_request.dart';
import '../../models/validate_email_model/validate_email_request.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, Unit>> signUp(
      {required SignUpRequest signUpRequest}) async {
    try {
      await apiService.postWithFormData(
          endPoint: ApiEndpoints.signUp, formData: signUpRequest.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login({required LoginRequest loginRequest}) async {
    try {
      var response = await apiService.get(
        endpoint: ApiEndpoints.login(loginRequest: loginRequest),
      );
      final loginResponse = LoginResponse.fromJson(response['item'][0]);
      await SharedPrefHelper.setData(
        key: SharedPrefKeys.token,
        value: loginResponse.token,
      );
      DioFactory.updateAuthToken(loginResponse.token);
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> validateEmail(
      {required ValidateEmailRequest validateEmailRequest}) async {
    try {
      await apiService.postWithFormData(
        endPoint: ApiEndpoints.validateEmail(otp: validateEmailRequest.otpCode),
        formData: validateEmailRequest.toJson(),
      );
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async {
    try {
      await apiService.get(
        endpoint: ApiEndpoints.forgetPassword(email: email),
      );
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ValidateEmailForForgetPasswordResponse>>
      validateEmailForForgetPassword(
          {required ValidateEmailForForgetPasswordRequest
              validateEmailForForgetPasswordRequest}) async {
    try {
      var response = await apiService.postWithFormData(
        endPoint: ApiEndpoints.forgetPassword(
            email: validateEmailForForgetPasswordRequest.email),
        formData: validateEmailForForgetPasswordRequest.toJson(),
      );
      final validateEmailForForgetPasswordResponse =
          ValidateEmailForForgetPasswordResponse.fromJson(response);
      return right(validateEmailForForgetPasswordResponse);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    try {
      await apiService.put(
        endpoint: ApiEndpoints.forgetPassword(
          email: resetPasswordRequest.email,
        ),
        queryParameters: resetPasswordRequest.toJson(),
      );
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
