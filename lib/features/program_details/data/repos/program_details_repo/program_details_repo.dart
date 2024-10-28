import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/policy_model/policy_model.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';
import 'package:toufwshouf/features/program_details/data/models/tour_including_model/tour_including_model.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../models/supplement_model/supplements_model.dart';

abstract class ProgramDetailsRepo {
  Future<Either<Failure, DetailsActiveProgramModel>> getProductDetails({
    required String programCode,
    required String programYear,
    required String languageCode,
  });

  Future<Either<Failure, List<PhotoGalleryModel>>> getPhotoGalleryImages({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, List<ReviewsModel>>> getAllReviews({
    required String programCode,
    required String programYear,
  });

  Future<Either<Failure, PolicyModel>> getPolicy({
    required String programCode,
    required String programYear,
    required String policyType,
  });

  Future<Either<Failure, List<SupplementsModel>>> getSupplements({
    required String programCode,
    required String programYear,
  });
  Future<Either<Failure, TourIncludingModel>> getTourIncluding({
    required String programCode,
    required String programYear,
  });
}
