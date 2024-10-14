import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/core/networking/api_service.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../models/sign_up_model/sign_up_request.dart';
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
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.login(
          email: email,
          password: password,
        ),
      );
      // final loginResponse = LoginResponse.fromJson(response);
      // if (loginResponse.message == "Login successful" && loginResponse.message.isNotEmpty) {
      //   await SharedPrefHelper.setData(
      //     key: SharedPrefKeys.accessToken,
      //     value: loginResponse.tokens.access,
      //   );
      //   await SharedPrefHelper.setData(
      //     key: SharedPrefKeys.refreshToken,
      //     value: loginResponse.tokens.refresh,
      //   );
      //   DioFactory.setTokenIntoHeaderAfterLogin(loginResponse.tokens.access);
      // }
      return Right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
