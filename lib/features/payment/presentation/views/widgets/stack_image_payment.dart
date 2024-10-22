import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_horizontal_list_view_item.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

class StackImagePayment extends StatelessWidget {
  const StackImagePayment({
    super.key, required this.activeProgramModel,
  });
  final ActiveProgramModel activeProgramModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(activeProgramModel.imgPath ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          ItemDetails(
            title: activeProgramModel.programname ?? '',
            rating: double.parse(
              activeProgramModel.rateReview ?? '0.0',
            ),
          ),
        ],
      ),
    );
  }
}
