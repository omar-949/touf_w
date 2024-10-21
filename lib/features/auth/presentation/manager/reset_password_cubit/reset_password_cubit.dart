import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/data/models/reset/reset_password_request.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword(
      {required ResetPasswordRequest resetPasswordRequest}) async {
    emit(ResetPasswordLoading());
    final response = await authRepo.resetPassword(
        resetPasswordRequest: resetPasswordRequest);
    response.fold(
      (failure) => emit(ResetPasswordFailure(errMessage: failure.message)),
      (unit) => emit(ResetPasswordSuccess()
      ),
    );
  }
}
