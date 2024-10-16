import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';

import '../../../data/models/log_in_model/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final response = await authRepo.login(loginRequest: loginRequest);
    response.fold(
          (failure) => emit(LoginFailure(errMessage: failure.message,)),
          (loginResponse) => emit(LoginSuccess()),
    );
  }
}
