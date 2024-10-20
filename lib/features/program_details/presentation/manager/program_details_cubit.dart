import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'program_details_state.dart';

class ProgramDetailsCubit extends Cubit<ProgramDetailsState> {
  ProgramDetailsCubit() : super(ProgramDetailsInitial());
}
