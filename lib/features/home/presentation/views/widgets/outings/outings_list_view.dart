import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/outings_program_item.dart';

class OutingsListView extends StatelessWidget {
  const OutingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return OutingsProgramItem();
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
