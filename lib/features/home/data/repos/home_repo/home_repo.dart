import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

import '../../../../../core/networking/api_failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ActiveProgramModel>>> getAllActivePrograms();

}