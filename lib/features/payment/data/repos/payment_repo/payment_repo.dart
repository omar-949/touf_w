import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../models/program_group_model/program_group_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<ExtraModel>>> getExtraPrograms({
    required String programCode,
    required String programYear,
  });
  Future<Either<Failure, List<ProgramDateAndNumberModel>>>
      getProgramDateAndNumber({
    required String programCode,
    required String programYear,
  });
  Future<Either<Failure, List<ProgramGroupModel>>> getProgramGroup({
    required String programCode,
    required String programYear,
    required int groupNum,
  });
}
