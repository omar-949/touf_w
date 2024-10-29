part of 'program_details_cubit.dart';

@immutable
abstract class ProgramDetailsState {}

class ProgramDetailsInitial extends ProgramDetailsState {}

class ProgramDetailsLoading extends ProgramDetailsState {}

class ProgramDetailsSuccess extends ProgramDetailsState {
  final List<DetailsActiveProgramModel>? productDetails;
  final List<PhotoGalleryModel>? photoGallery;
  final List<ReviewsModel>? reviews;
  final List<PolicyModel>? policy;
  final List<SupplementsModel>? supplements;
  final List<TourIncludingModel>? tourIncluding;

  ProgramDetailsSuccess({
    this.productDetails,
    this.photoGallery,
    this.reviews,
    this.policy,
    this.supplements,
    this.tourIncluding,
  });
}

class ProgramDetailsFailure extends ProgramDetailsState {
  final String message;
  ProgramDetailsFailure(this.message);
}
