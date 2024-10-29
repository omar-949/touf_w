import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/review_request.dart';
import 'package:toufwshouf/features/program_details/data/repos/program_details_repo/program_details_repo_impl.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.programDetailsRepoImpl) : super(ReviewInitial());
  final ProgramDetailsRepoImpl programDetailsRepoImpl;
  Future<void> postCustReview({
    required int programCode,
    required int programYear,
    required ReviewRequest reviewRequest,
  }) async {
    final result = await programDetailsRepoImpl.postCustReview(
      programCode: programCode,
      programYear: programYear,
      reviewRequest: reviewRequest,
    );
    result.fold(
          (failure) => emit(ProgramReviewFailure(failure.message)),
          (custReview) => emit(ProgramReviewSuccess()),
    );
  }
}

