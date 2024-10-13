import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({
    required String phone,
    required String email,
    required String userName,
    required String password,
    required String nat,
    required String address,
  }) async {
    emit(SignUpLoading());
    final response = await authRepo.signUp(phone: phone, email: email, userName: userName, password: password, nat: nat, address: address);
    response.fold(
          (failure) => emit(SignUpFailure(errMessage: failure.message)),
          (signUpResponse) => emit(SignUpSuccess()),
    );
  }
}
