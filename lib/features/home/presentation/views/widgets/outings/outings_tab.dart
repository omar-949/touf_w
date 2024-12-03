import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/active_programs.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/advertisements.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/best_offer_program.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/partners.dart';

class OutingsTab extends StatelessWidget {
  const OutingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ActivePrograms(),
        10.verticalSpace,
        const Advertisements(),
        10.verticalSpace,
        //const BestOfferProgram(),
        10.verticalSpace,
        const Partners(),
      ],
    );
  }
}
