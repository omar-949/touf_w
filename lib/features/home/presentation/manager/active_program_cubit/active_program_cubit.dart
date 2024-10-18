import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/home/data/repos/home_repo/home_repo.dart';

part 'active_program_state.dart';

class ActiveProgramCubit extends Cubit<ActiveProgramState> {
  ActiveProgramCubit(this.homeRepo) : super(ActiveProgramInitial());
  final HomeRepo homeRepo;

  Future<void> getAllActivePrograms() async {
    emit(ActiveProgramLoading());
    final result = await homeRepo.getAllActivePrograms();
    result.fold(
      (failure) => emit(ActiveProgramFailure (errMessage: failure.message)),
      (activePrograms) => emit(ActiveProgramSuccess(activeProgramModel: activePrograms)),
    );
  }
}
