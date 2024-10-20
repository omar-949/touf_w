import 'package:flutter/material.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_item.dart';

class ReviewItemListView extends StatelessWidget {
  const ReviewItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, i) {
          return const ReviewItem();
        });
  }
}
