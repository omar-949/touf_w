import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

class ProgramDetailsBookButton extends StatelessWidget {
  const ProgramDetailsBookButton({super.key, required this.activeProgramModel});

  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomButton(
          text: 'Book Now',
          borderRadius: BorderRadius.circular(12.r),
          onPressed: () {
            context.pushNamed(
              Routes.paymentView,
              arguments: {'activeProgramModel': activeProgramModel},
            );
          },
        ),
      ),
    );
  }
}
