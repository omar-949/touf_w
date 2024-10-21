import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_for_forget_password_request.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_for_forget_password_response.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_request.dart';

import '../../../data/repos/auth_repo/auth_repo.dart';

part 'validate_email_state.dart';

class ValidateEmailCubit extends Cubit<ValidateEmailState> {
  ValidateEmailCubit(this.authRepo) : super(ValidateEmailInitial());
  final AuthRepo authRepo;

  Future<void> validateOtp(
      {required ValidateEmailRequest validateEmailRequest}) async {
    emit(ValidateEmailLoading());
    final response = await authRepo.validateEmail(
        validateEmailRequest: validateEmailRequest);
    response.fold(
      (failure) => emit(ValidateEmailFailure(errMessage: failure.message)),
      (validateOtpResponse) => emit(ValidateEmailSuccess()),
    );
  }

  Future<void> validateOtpForForgetPassword(
      {required ValidateEmailForForgetPasswordRequest
          validateEmailForForgetPasswordRequest}) async {
    emit(ValidateEmailLoading());
    final response = await authRepo.validateEmailForForgetPassword(
      validateEmailForForgetPasswordRequest: validateEmailForForgetPasswordRequest,
    );
    response.fold(
      (failure) => emit(ValidateEmailFailure(errMessage: failure.message)),
      (validateEmailForForgetPasswordResponse) => emit(ValidateEmailForForgetPasswordSuccess(
          validateEmailForForgetPasswordResponse:
              validateEmailForForgetPasswordResponse)),
    );
  }
}
