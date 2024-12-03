import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/tour_including_model/tour_including_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/expandable_container.dart';

import '../../../data/models/policy_model/policy_model.dart';

class TourDetails extends StatelessWidget {
  const TourDetails({
    super.key,
    required this.tourIncludingModel, required this.policyModel,
  });

  final List<TourIncludingModel> tourIncludingModel;
  final List<PolicyModel> policyModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            ExpandableContainer(
              title: 'Tour Including',
              description: tourIncludingModel.isNotEmpty ? tourIncludingModel[0].tourIncludin ?? 'There is no tour including'  : 'Theres is no tour including',
            ),
            12.verticalSpace,
             ExpandableContainer(
              title: 'Cancellation policy',
              description: policyModel.isNotEmpty ? policyModel[0].policy ?? 'There is no policy' : 'There is no policy',
            ),
          ],
        ),
      ),
    );
  }
}
