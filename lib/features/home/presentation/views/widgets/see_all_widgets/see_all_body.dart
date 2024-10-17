import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_list_view_item.dart';

class SeeAllBody extends StatelessWidget {
  const SeeAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SeeAllListViewItem();
      },
      itemCount: 10,
    );
  }
}
