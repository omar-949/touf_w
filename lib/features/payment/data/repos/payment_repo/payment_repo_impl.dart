import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/data/repos/payment_repo/payment_repo.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_service.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiService apiService;

  PaymentRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<ExtraModel>>> getExtraPrograms(
      {required String programCode, required String programYear}) async {
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getExtraPrograms(
              programCode: programCode, programYear: programYear));
      List<ExtraModel> extraPrograms = [];

      for (var item in response['items']) {
        extraPrograms.add(ExtraModel.fromJson(item));
      }
      return Right(extraPrograms);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProgramDateAndNumberModel>>>
      getProgramDateAndNumber(
          {required String programCode, required String programYear}) async {
    try {
      final response = await apiService.get(endpoint: ApiEndpoints.getProgramDateAndNumber(programCode: programCode, programYear: programYear));
      List<ProgramDateAndNumberModel> programGroups = [];

      for (var item in response['items']) {
        programGroups.add(ProgramDateAndNumberModel.fromJson(item));
      }
      return Right(programGroups);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProgramGroupModel>>> getProgramGroup(
      {required String programCode,
      required String programYear,
      required int groupNum}) async {
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getProgramGroup(
              programCode: programCode,
              programYear: programYear,
              groupNum: groupNum));
      List<ProgramGroupModel> programGroup = [];

      for (var item in response['items']) {
        programGroup.add(ProgramGroupModel.fromJson(item));
      }
      return Right(programGroup);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
