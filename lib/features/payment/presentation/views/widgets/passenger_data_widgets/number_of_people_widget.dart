import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/build_count_selector.dart';
import '../../../../../../core/resources/styles.dart';

class NumberOfPeopleWidget extends StatelessWidget {
  final String title;
  final List<ProgramGroupModel> people;
  final int count;
  final VoidCallback onUpdate;
  final int maxAval;
   const NumberOfPeopleWidget({
    super.key,
    required this.title,
    required this.people,
    required this.count, required this.onUpdate, required this.maxAval,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffffbfb),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: TextStyles.font18darkGreyMedium),
                SizedBox(width: 8.w),
                Text('$count',
                    style: TextStyles.font22darkGreyMedium
                        .copyWith(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            ...people.map((person) => Padding(
              padding: EdgeInsets.only(bottom: 16.0.h,left: 10.w,right: 10.w),
              child: BuildCountSelector(maxAval: maxAval,person: person,  onUpdate: onUpdate,),
            )),
          ],
        ),
      ),
    );
  }
}
