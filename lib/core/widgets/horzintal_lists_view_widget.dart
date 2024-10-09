import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container_details.dart';

class TripsListView extends StatelessWidget {
  final List<CustomContainerDetails> tripsList;

  const TripsListView({super.key, required this.tripsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tripsList.length,
        itemBuilder: (BuildContext context, int index) {
          return tripsList[index];
        },
      ),
    );
  }
}
