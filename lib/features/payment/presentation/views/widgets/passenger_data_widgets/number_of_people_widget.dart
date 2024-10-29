import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/count_selector_list.dart';
import '../../../../../../core/resources/styles.dart';

class NumberOfPeopleWidget extends StatelessWidget {
  final String title;
  final List<ProgramGroupModel> people;
  final int count;
  final VoidCallback onUpdate;

  const NumberOfPeopleWidget(
      {super.key,
      required this.title,
      required this.people,
      required this.count,
      required this.onUpdate});

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
            CountSelectorList(people: people, count: count, onUpdate: onUpdate)
          ],
        ),
      ),
    );
  }
}
