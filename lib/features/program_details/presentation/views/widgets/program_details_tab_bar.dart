import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/details_tab_bar_cubit/details_tab_bar_cubit.dart';

class ProgramDetailsTabBar extends StatelessWidget {
  const ProgramDetailsTabBar({super.key,});



  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final tabNames = [
              'Overview',
              'Supplement',
              'Photo Gallery',
              'Reviews'
            ];
            return BlocBuilder<DetailsTabBarCubit, DetailsTabBarState>(
              builder: (context, state) {
                final cubit = context.read<DetailsTabBarCubit>();
                if (state is DetailsTabBarIndexUpdated) {
                  return GestureDetector(
                    onTap: () => cubit.changeTab(index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(tabNames[index], style: state.index == index
                          ? TextStyles.font18OrangeMedium
                          : TextStyles.font18MediumGreyMedium,
                      ),
                    ),
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}