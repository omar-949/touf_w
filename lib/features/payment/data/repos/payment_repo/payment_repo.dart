import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_groups/program_groups_model.dart';

import '../../../../../core/networking/api_failure.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<ExtraModel>>> getExtraPrograms(
      {required String programCode, required String programYear});
  Future<Either<Failure, List<ProgramGroupsModel>>> getAllProgramGroups(
      {required String programCode, required String programYear});
}
