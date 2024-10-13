import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/core/networking/api_service.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/dio_factory.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, Unit>> signUp({
    required String phone,
    required String email,
    required String userName,
    required String password,
    required String nat,
    required String address,
  }) async {
    try {
      final response = await apiService.post(
        endpoint: ApiEndpoints.signUp,
        data: {
          "CNAME": userName,
          "NAT": nat,
          "TEL": phone,
          "C_PASS": password,
          "p_Mail": email,
          "C_ADDRESS": email,
        },
        // data: signUpRequest.toJson(),
      );
      // final signUpResponse = SignUpResponse.fromJson(response);
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
  Future<Either<Failure, Unit>> login({required String email, required String password,}) async {
    try {
      final response = await apiService.post(
        endpoint: "${ApiEndpoints.login}/$email/$password",
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
