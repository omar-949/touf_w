import 'package:dartz/dartz.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/features/best_selling/data/models/active_program_model.dart';

abstract class ActiveProgramRepo {
  Future<Either<Failure, List<ActiveProgramModel>>> getAllActivePrograms({required int flag});
}
