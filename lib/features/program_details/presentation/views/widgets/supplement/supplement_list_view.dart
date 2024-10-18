import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_list_view_item.dart';

class SupplementListView extends StatelessWidget {
  const SupplementListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0.h),
            child: const SupplementListViewItem(
              desc: "12 working hours Hyundai H1 car",
              price: 1200,
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
