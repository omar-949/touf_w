import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          section: "Partners",
        ),
        10.verticalSpace,
        SizedBox(
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.partners1,
              ),
              Image.asset(
                Assets.partners2,
              ),
              Image.asset(
                Assets.partners3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
