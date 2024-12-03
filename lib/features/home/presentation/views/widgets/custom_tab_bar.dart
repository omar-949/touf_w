import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/manager/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/custom_tab.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tabNames = ['Outings', 'Hotels', 'Transportation'];
          final tabIcons = [
            'assets/svgs/outings.svg',
            'assets/svgs/hotels.svg',
            'assets/svgs/Transportation.svg',
          ];
          return BlocBuilder<TabBarCubit, TabBarState>(
            builder: (context, state) {
              final cubit = context.read<TabBarCubit>();
              if (state is TabBarIndexUpdated) {
                return GestureDetector(
                  onTap: () => cubit.changeTab(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomTab(
                      iconPath: tabIcons[index],
                      text: tabNames[index],
                      isActive: state.index == index,
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
