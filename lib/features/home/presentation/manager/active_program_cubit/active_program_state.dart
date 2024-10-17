part of 'active_program_cubit.dart';

@immutable
sealed class ActiveProgramState {}

final class ActiveProgramInitial extends ActiveProgramState {}
final class ActiveProgramLoading extends ActiveProgramState {}
final class ActiveProgramSuccess extends ActiveProgramState {
  final List<ActiveProgramModel> activeProgramModel;

  ActiveProgramSuccess({required this.activeProgramModel});
}
final class ActiveProgramFailure extends ActiveProgramState {
  final String errMessage;
  ActiveProgramFailure({required this.errMessage});
}
