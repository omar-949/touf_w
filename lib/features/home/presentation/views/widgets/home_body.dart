import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/features/home/presentation/manager/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/custom_tab_bar.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/tab_bar_content.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250.h,
          toolbarHeight: 0,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(
                      Assets.mainImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                  options: CarouselOptions(
                    height: 250.h,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),

                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  left: 0,
                  right: 0,
                  child: const CustomTabBar(),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<TabBarCubit, TabBarState>(
            builder: (context, state) {
              if (state is TabBarIndexUpdated) {
                return TabBarContent(
                  index: state.index,
                );
              }
              return const TabBarContent(
                index: 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
