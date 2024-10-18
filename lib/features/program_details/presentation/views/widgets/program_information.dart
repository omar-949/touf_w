import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information_tile.dart';

class ProgramInformation extends StatelessWidget {
  const ProgramInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
                const BoxShadow(
                  color: Colors.transparent,
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(-2, -2),
                ),
              ],
            ),
            child: const Column(children: [
              ProgramInformationTile(
                  svg: 'assets/svgs/location.svg',
                  title: 'Location: ',
                  value: 'Egypt, Cairo'),
              ProgramInformationTile(
                  svg: 'assets/svgs/price.svg',
                  title: 'Price: ',
                  value: '850 EGP'),
              ProgramInformationTile(
                  svg: 'assets/svgs/clock.svg',
                  title: 'Duration time: ',
                  value: '3 Hour/s'),
              ProgramInformationTile(
                  svg: 'assets/svgs/walking.svg',
                  title: '',
                  value: 'Walking Tour'),
            ])),
      ),
    );
  }
}
