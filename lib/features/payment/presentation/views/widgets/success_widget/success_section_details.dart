import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/success_section_details_widget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/success_section_header.dart';

class SuccessSectionDetails extends StatelessWidget {
  const SuccessSectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: TextColors.light2white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.102),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SuccessSectionHeader(),
          SizedBox(height: 15.h),
          const SuccessSectionDetailsWidget(),
        ],
      ),
    );
  }
}
