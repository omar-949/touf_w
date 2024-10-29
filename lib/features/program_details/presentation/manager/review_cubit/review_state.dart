part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}
class ProgramReviewLoading extends ReviewState {}
class ProgramReviewSuccess extends ReviewState {

}
class ProgramReviewFailure extends ReviewState {
  final String message;
  ProgramReviewFailure(this.message);
}