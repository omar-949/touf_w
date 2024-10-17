import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_list_view_item.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return HotelsListViewItem();
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
    );
  }
}
