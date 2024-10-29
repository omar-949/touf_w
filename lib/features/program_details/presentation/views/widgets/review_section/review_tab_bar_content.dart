import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_form.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_item_list_view.dart';

class ReviewTabBarContent extends StatelessWidget {
  const ReviewTabBarContent({
    super.key,
    required this.activeProgramModel,
  });

  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReviewItemListView(),
        ReviewForm(
          activeProgramModel: activeProgramModel,
        )
      ],
    );
  }
}
