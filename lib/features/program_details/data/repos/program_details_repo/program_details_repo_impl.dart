import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:toufwshouf/core/networking/api_failure.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';
import 'package:toufwshouf/features/program_details/data/repos/program_details_repo/program_details_repo.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_service.dart';

class ProgramDetailsRepoImpl implements ProgramDetailsRepo {
  final ApiService apiService;

  ProgramDetailsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, DetailsActiveProgramModel>> getProductDetails({required String programCode, required String programYear}) async{
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getProgramDetails(programCode: programCode, programYear: programYear));
      var item = response['items'][0];
      DetailsActiveProgramModel detailsActiveProgram = DetailsActiveProgramModel.fromJson(item);

      return Right(detailsActiveProgram);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<PhotoGalleryModel>>> getPhotoGalleryImages({required String programCode, required String programYear}) async{
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getPhotoGalleryImages(programCode: programCode, programYear: programYear));
      List<PhotoGalleryModel> photoGalleryImages = [];

      for (var item in response['items']) {
        photoGalleryImages.add(PhotoGalleryModel.fromJson(item));
      }
      return Right(photoGalleryImages);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ReviewsModel>>> getAllReviews({required String programCode, required String programYear}) async{
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getAllReviews(programCode: programCode, programYear: programYear));
      List<ReviewsModel> reviews = [];

      for (var item in response['items']) {
        reviews.add(ReviewsModel.fromJson(item));
      }
      return Right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }


}