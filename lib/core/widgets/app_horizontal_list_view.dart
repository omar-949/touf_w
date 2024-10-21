import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_horizontal_list_view_item.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

class AppHorizontalListView extends StatelessWidget {
  const AppHorizontalListView({super.key, required this.activeProgramModel, this.onTap});
  final List<ActiveProgramModel> activeProgramModel;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return AppHorizontalListViewItem(
            activeProgramModel: activeProgramModel[index],
            onTap: () {
              if (onTap != null) {
                onTap!(index);
              }
            },
          );
        },
        itemCount: activeProgramModel.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
