import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_container_details.dart';
import '../../../../../core/widgets/horzintal_lists_view_widget.dart';
import '../../../../../core/widgets/list_view_header.dart';

class RelatedListWidget extends StatelessWidget {
  final List<CustomContainerDetails> relatedList; // Use your trip details here
  final VoidCallback? onSeeAllPressed;

  const RelatedListWidget({
    Key? key,
    required this.relatedList,
    this.onSeeAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Related List",
          onSeeAllPressed: onSeeAllPressed,
        ),
        TripsListView(tripsList: relatedList),
      ],
    );
  }
}
