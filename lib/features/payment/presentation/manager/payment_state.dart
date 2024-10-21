part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentSuccess extends PaymentState {
  final List<ProgramDateAndNumberModel> programDateAndNumber;
  final List<ExtraModel> extraPrograms;
  final List<ProgramGroupModel> programGroups;

  PaymentSuccess({required this.extraPrograms, required this.programGroups, required this.programDateAndNumber});
}
final class PaymentFailure extends PaymentState {
  final String errMessage;
  PaymentFailure({required this.errMessage});
}
