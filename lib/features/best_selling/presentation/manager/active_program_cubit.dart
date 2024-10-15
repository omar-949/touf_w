import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/best_selling/data/models/active_program_model.dart';
import 'package:toufwshouf/features/best_selling/data/repos/home_repo_impl.dart';

part 'active_program_state.dart';

class ActiveProgramCubit extends Cubit<ActiveProgramState> {
  ActiveProgramCubit(this.activeProgramRepoImpl)
      : super(ActiveProgramInitial());
  final ActiveProgramRepoImpl activeProgramRepoImpl;

  Future<void> getAllActivePrograms({required int flag}) async {
    emit(ActiveProgramLoading());
    final response =
        await activeProgramRepoImpl.getAllActivePrograms(flag: flag);
    response.fold(
      (failure) => emit(
        ActiveProgramFailure(errorMessage: failure.message),
      ),
      (activePrograms) => emit(
        ActiveProgramSuccess(activePrograms: activePrograms),
      ),
    );
  }
}
