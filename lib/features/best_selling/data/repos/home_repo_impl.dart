import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:toufwshouf/core/networking/api_endpoints.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/core/networking/api_service.dart';
import 'package:toufwshouf/features/best_selling/data/models/active_program_model.dart';
import 'package:toufwshouf/features/best_selling/data/repos/home_repo.dart';

class ActiveProgramRepoImpl extends ActiveProgramRepo {
  final ApiService apiService;

  ActiveProgramRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ActiveProgramModel>>> getAllActivePrograms(
      {required int flag}) async {
    try {
      final response = await apiService.get(
        endpoint: ApiEndpoints.getAllActivePrograms(flag: 1),
      );
      final List<ActiveProgramModel> activePrograms = [];
      for (var item in response['items']) {
        activePrograms.add(ActiveProgramModel.fromJson(item));
      }
      return right(activePrograms);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
