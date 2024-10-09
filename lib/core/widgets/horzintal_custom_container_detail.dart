import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/custom_container_details.dart';
import '../../../../core/widgets/rating_widget.dart';

class HorzintalCustomContainerDetail extends StatelessWidget {
  final CustomContainerDetails containerDetails;
  final String tripName;
  final double rating;

  const HorzintalCustomContainerDetail({
    Key? key,
    required this.containerDetails,
    required this.tripName,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          containerDetails,
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tripName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font16BlackMedium,
                ),
                SizedBox(height: 50.h),
                CustomRatingWidget(rating: rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
