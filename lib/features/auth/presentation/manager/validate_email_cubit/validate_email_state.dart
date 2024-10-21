part of 'validate_email_cubit.dart';

@immutable
sealed class ValidateEmailState {}

final class ValidateEmailInitial extends ValidateEmailState {}

final class ValidateEmailLoading extends ValidateEmailState {}

final class ValidateEmailSuccess extends ValidateEmailState {}

final class ValidateEmailForForgetPasswordSuccess extends ValidateEmailState {
  final ValidateEmailForForgetPasswordResponse validateEmailForForgetPasswordResponse;

  ValidateEmailForForgetPasswordSuccess({required this.validateEmailForForgetPasswordResponse});
}

final class ValidateEmailFailure extends ValidateEmailState {
  final String errMessage;
  ValidateEmailFailure({required this.errMessage});
}
