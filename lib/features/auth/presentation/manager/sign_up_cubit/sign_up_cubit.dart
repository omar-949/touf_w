import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';

import '../../../data/models/sign_up_model/sign_up_request.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
  required SignUpRequest signUpRequest
  }) async {
    emit(SignUpLoading());
    final response = await authRepo.signUp(signUpRequest: signUpRequest);
    response.fold(
          (failure) => emit(SignUpFailure(errMessage: failure.message)),
          (signUpResponse) => emit(SignUpSuccess()),
    );
  }
}
