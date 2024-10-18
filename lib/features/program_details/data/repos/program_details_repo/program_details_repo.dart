import 'package:dartz/dartz.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';

import '../../../../../core/networking/api_failure.dart';

abstract class ProgramDetailsRepo {
  Future<Either<Failure, DetailsActiveProgramModel>> getProductDetails({required String programCode, required String programYear});
  Future<Either<Failure, List<PhotoGalleryModel>>> getPhotoGalleryImages({required String programCode, required String programYear});
  Future<Either<Failure, List<ReviewsModel>>> getAllReviews({required String programCode, required String programYear});
}