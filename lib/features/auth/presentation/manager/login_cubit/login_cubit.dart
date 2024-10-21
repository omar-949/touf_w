import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/networking/dio_factory.dart';
import 'package:toufwshouf/features/auth/data/models/log_in_model/login_response.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:toufwshouf/main.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../data/models/log_in_model/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.login(loginRequest: loginRequest);
    response.fold(
          (failure) =>
          emit(LoginFailure(
            errMessage: failure.message,
          )),
          (loginResponse) async {
        // Save the token and update Dio before emitting success
        await saveUserToken(loginResponse.token);
        isLoggedUser = true;
        emit(LoginSuccess(loginResponse: loginResponse));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(
        key: SharedPrefKeys.accessToken, value: token);
    DioFactory.updateAuthToken(token);
  }
}
