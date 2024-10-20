part of 'get_program_date_and_number_cubit.dart';

@immutable
abstract class GetProgramDateAndNumberState {}

class GetProgramDateAndNumberInitial extends GetProgramDateAndNumberState {}
class GetProgramDateAndNumberLoading extends GetProgramDateAndNumberState {}
class GetProgramDateAndNumberSuccess extends GetProgramDateAndNumberState {
  final List<ProgramDateAndNumberModel>  programDateAndNumber;

  GetProgramDateAndNumberSuccess({required this.programDateAndNumber});
}
class GetProgramDateAndNumberFailure extends GetProgramDateAndNumberState {
  final String errorMessage;

  GetProgramDateAndNumberFailure({required this.errorMessage});
}
