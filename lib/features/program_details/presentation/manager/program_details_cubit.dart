import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/policy_model/policy_model.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';
import 'package:toufwshouf/features/program_details/data/models/supplement_model/supplements_model.dart';
import 'package:toufwshouf/features/program_details/data/models/tour_including_model/tour_including_model.dart';
import 'package:toufwshouf/features/program_details/data/repos/program_details_repo/program_details_repo_impl.dart';

part 'program_details_state.dart';

class ProgramDetailsCubit extends Cubit<ProgramDetailsState> {
  final ProgramDetailsRepoImpl programDetailsRepoImpl;

  DetailsActiveProgramModel? productDetails;
  List<PhotoGalleryModel>? photoGallery;
  List<ReviewsModel>? reviews;
  PolicyModel? policy;
  List<SupplementsModel>? supplements;
  TourIncludingModel? tourIncluding;

  int totalMethods = 6;
  int completedMethods = 0;

  ProgramDetailsCubit(this.programDetailsRepoImpl)
      : super(ProgramDetailsInitial());

  void _checkIfAllMethodsCompleted() {
    completedMethods++;
    if (completedMethods == totalMethods) {
      emit(
        ProgramDetailsLoaded(
          productDetails: productDetails,
          photoGallery: photoGallery,
          reviews: reviews,
          policy: policy,
          supplements: supplements,
          tourIncluding: tourIncluding,
        ),
      );
    }
  }

  Future<void> fetchAllProgramDetails({
    required String programCode,
    required String programYear,
  }) async {
    emit(ProgramDetailsLoading());

    await _fetchProductDetails(programCode, programYear);
    await _fetchPhotoGalleryImages(programCode, programYear);
    await _fetchAllReviews(programCode, programYear);
    await _fetchPolicy(programCode, programYear, "policyType");
    await _fetchSupplements(programCode, programYear);
    await _fetchTourIncluding(programCode, programYear);
  }

  Future<void> _fetchProductDetails(
      String programCode, String programYear) async {
    final result = await programDetailsRepoImpl.getProductDetails(
      programCode: programCode,
      programYear: programYear,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (details) {
        productDetails = details;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> _fetchPhotoGalleryImages(
      String programCode, String programYear) async {
    final result = await programDetailsRepoImpl.getPhotoGalleryImages(
      programCode: programCode,
      programYear: programYear,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (images) {
        photoGallery = images;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> _fetchAllReviews(String programCode, String programYear) async {
    final result = await programDetailsRepoImpl.getAllReviews(
      programCode: programCode,
      programYear: programYear,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (reviewsData) {
        reviews = reviewsData;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> _fetchPolicy(
      String programCode, String programYear, String policyType) async {
    final result = await programDetailsRepoImpl.getPolicy(
      programCode: programCode,
      programYear: programYear,
      policyType: policyType,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (policyData) {
        policy = policyData;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> _fetchSupplements(String programCode, String programYear) async {
    final result = await programDetailsRepoImpl.getSupplements(
      programCode: programCode,
      programYear: programYear,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (supplementsData) {
        supplements = supplementsData;
        _checkIfAllMethodsCompleted();
      },
    );
  }

  Future<void> _fetchTourIncluding(
      String programCode, String programYear) async {
    final result = await programDetailsRepoImpl.getTourIncluding(
      programCode: programCode,
      programYear: programYear,
    );
    result.fold(
      (failure) => emit(ProgramDetailsError(failure.message)),
      (tourData) {
        tourIncluding = tourData;
        _checkIfAllMethodsCompleted();
      },
    );
  }
}
