import 'package:flutter/material.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_form.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_item_list_view.dart';

class ReviewTabBarContent extends StatelessWidget {
  const ReviewTabBarContent({super.key,});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        ReviewItemListView(),
        ReviewForm()
      ],
    );
  }
}
