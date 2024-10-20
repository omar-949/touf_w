import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';
import 'package:toufwshouf/features/payment/data/repos/payment_repo/payment_repo.dart';
part 'get_program_date_and_number_state.dart';

class GetProgramDateAndNumberCubit extends Cubit<GetProgramDateAndNumberState> {
  GetProgramDateAndNumberCubit(this.paymentRepo)
      : super(GetProgramDateAndNumberInitial());
  final PaymentRepo paymentRepo;

  Future<void> getProgramDateAndNumber(
      {required String programCode, required String programYear}) async {
    emit(GetProgramDateAndNumberLoading());
    final response = await paymentRepo.getProgramDateAndNumber(
        programCode: programCode, programYear: programYear);
    response.fold(
      (failure) => emit(GetProgramDateAndNumberFailure(
        errorMessage: failure.message,
      )),
      (success) {
        emit(GetProgramDateAndNumberSuccess(programDateAndNumber: success));
      },
    );
  }
}
