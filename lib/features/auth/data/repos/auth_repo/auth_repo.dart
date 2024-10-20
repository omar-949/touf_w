import 'package:dartz/dartz.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/features/auth/data/models/log_in_model/login_request.dart';
import 'package:toufwshouf/features/auth/data/models/log_in_model/login_response.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_request.dart';

import '../../models/sign_up_model/sign_up_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUp({required SignUpRequest signUpRequest});
  Future<Either<Failure, LoginResponse>> login({required LoginRequest loginRequest});
  Future<Either<Failure, Unit>> validateEmail(
      {required ValidateEmailRequest validateEmailRequest});
}
