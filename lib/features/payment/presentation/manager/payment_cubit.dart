import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import '../../data/repos/payment_repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());

  final PaymentRepo paymentRepo;
  List<ProgramDateAndNumberModel> programsDateAndNumber = [];
  List<ExtraModel> extraPrograms = [];
  List<ProgramGroupModel> programGroup = [];

  int totalMethods = 3;
  int completedMethods = 0;

  void _checkIfAllMethodsCompleted() {
    completedMethods++;
    if (completedMethods == totalMethods) {
      emit(PaymentSuccess(
        extraPrograms: extraPrograms,
        programGroups: programGroup,
        programDateAndNumber: programsDateAndNumber,
      ));
    }
  }

  Future<void> getPaymentData({
    required String programCode,
    required String programYear,
  }) async {
    emit(PaymentLoading());

    await getProgramDateAndNumber(
      programCode: programCode,
      programYear: programYear,
    );
    await getExtraPrograms(
      programCode: programCode,
      programYear: programYear,
    );

    // استخدم أول عنصر للحصول على groupNum
    if (programsDateAndNumber.isNotEmpty) {
      int groupNum = programsDateAndNumber.first.progGrpNo ?? 1; // استخدام رقم المجموعة من أول عنصر
      await getProgramGroup(
        programCode: programCode,
        programYear: programYear,
        groupNum: groupNum,
      );
    }
  }

  Future<void> getProgramDateAndNumber({
    required String programCode,
    required String programYear,
  }) async {
    final response = await paymentRepo.getProgramDateAndNumber(
        programCode: programCode, programYear: programYear);
    response.fold(
          (failure) => emit(PaymentFailure(
        errMessage: failure.message,
      )),
          (success) {
        programsDateAndNumber = success;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> getExtraPrograms({
    required String programCode,
    required String programYear,
  }) async {
    final response = await paymentRepo.getExtraPrograms(
        programCode: programCode, programYear: programYear);
    response.fold(
          (failure) => emit(PaymentFailure(
        errMessage: failure.message,
      )),
          (success) {
        extraPrograms = success;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> getProgramGroup({
    required String programCode,
    required String programYear,
    required int groupNum,
  }) async {
    final response = await paymentRepo.getProgramGroup(
        programCode: programCode, programYear: programYear, groupNum: groupNum);
    response.fold(
          (failure) => emit(PaymentFailure(
        errMessage: failure.message,
      )),
          (success) {
        programGroup = success;
        _checkIfAllMethodsCompleted();
      },
    );
  }
}
