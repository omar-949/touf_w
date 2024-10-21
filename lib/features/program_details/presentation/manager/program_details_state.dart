part of 'program_details_cubit.dart';

@immutable
abstract class ProgramDetailsState {}

class ProgramDetailsInitial extends ProgramDetailsState {}

class ProgramDetailsLoading extends ProgramDetailsState {}

class ProgramDetailsLoaded extends ProgramDetailsState {
  final DetailsActiveProgramModel? productDetails;
  final List<PhotoGalleryModel>? photoGallery;
  final List<ReviewsModel>? reviews;
  final PolicyModel? policy;
  final List<SupplementsModel>? supplements;
  final TourIncludingModel? tourIncluding;

  ProgramDetailsLoaded({
    this.productDetails,
    this.photoGallery,
    this.reviews,
    this.policy,
    this.supplements,
    this.tourIncluding,
  });
}

class ProgramDetailsError extends ProgramDetailsState {
  final String message;
  ProgramDetailsError(this.message);
}
