import 'package:dartz/dartz.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUp({
    required String phone,
    required String email,
    required String userName,
    required String password,
    required String nat,
    required String address
  });
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });
}
