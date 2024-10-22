
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final response = await authRepo.forgetPassword(email: email);
    response.fold(
      (failure) => emit(ForgetPasswordFailure(errMessage: failure.message)),
      (unit) => emit(ForgetPasswordSuccess()),
    );
  }
}
