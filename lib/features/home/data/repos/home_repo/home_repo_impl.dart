import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/core/networking/api_service.dart';

import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

import '../../../../../core/networking/api_endpoints.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<ActiveProgramModel>>> getAllActivePrograms() async {
    try {
      final response = await apiService.get(endpoint: ApiEndpoints.getAllActivePrograms(flag: 1));
      List<ActiveProgramModel> activePrograms = [];

      for (var item in response['items']) {
        activePrograms.add(ActiveProgramModel.fromJson(item));
      }
      return Right(activePrograms);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
