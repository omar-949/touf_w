import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'custom_container_details.dart';
import 'horzintal_custom_container_detail.dart';

class ReusableListScreen extends StatelessWidget {
  final String title;
  final List<CustomContainerDetails> items;

  const ReusableListScreen({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        route: '/homeScreen',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            // Assuming tripName and rating are part of CustomContainerDetails
            return HorzintalCustomContainerDetail(
              containerDetails: items[index],
              tripName: items[index].tripName ?? 'Unknown Trip', // Adjust accordingly
              rating: items[index].rating,
            );
          },
        ),
      ),
    );
  }
}
