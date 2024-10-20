import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../models/program_group_model/program_group_model.dart';
import '../../models/program_groups_model/program_groups_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<ExtraModel>>> getExtraPrograms({
    required String programCode,
    required String programYear,
  });
  Future<Either<Failure, List<ProgramGroupsModel>>> getAllProgramGroups({
    required String programCode,
    required String programYear,
  });
  Future<Either<Failure, List<ProgramGroupModel>>> getProgramGroup({
    required String programCode,
    required String programYear,
    required int groupNum,
  });
}
