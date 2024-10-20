part of 'program_details_cubit.dart';

@immutable
abstract class ProgramDetailsState {}

class ProgramDetailsInitial extends ProgramDetailsState {}
class ProgramDetailsLoading extends ProgramDetailsState {}
class ProgramDetailsSuccess extends ProgramDetailsState {

}
class ProgramDetailsFailure extends ProgramDetailsState {
  final String errorMessage;
  ProgramDetailsFailure({required this.errorMessage});
}



