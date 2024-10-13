import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> login({required String email,required String password}) async {
    emit(LoginLoading());
    final response = await authRepo.login(email: email, password: password);
    response.fold(
          (failure) => emit(LoginFailure(errMessage: failure.message,)),
          (loginResponse) => emit(LoginSuccess()),
    );
  }
}
