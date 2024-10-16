import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/custom_tab_bar.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/search_field.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/tab_bar_content.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          10.verticalSpace,
          Stack(
            children: [
              Image.asset(
                Assets.mainImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Row(
                children: [
                  Expanded(child: SearchField()),
                  Image.asset(
                    Assets.filter,
                    height: 24.h,
                    width: 24.w,
                  ),
                  10.horizontalSpace,
                ],
              ),
              Positioned(
                top: 200.h,
                bottom: 0.h,
                right: 0,
                left: 0,
                child: CustomTabBar(
                  tabController: _tabController,
                ),
              ),
            ],
          ),
          TabBarContent(
            tabController: _tabController,
          ),
        ],
      ),
    );
  }
}
