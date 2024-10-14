import 'package:dartz/dartz.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';

import '../../models/sign_up_model/sign_up_request.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUp({
    required SignUpRequest signUpRequest
  });
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });
}
