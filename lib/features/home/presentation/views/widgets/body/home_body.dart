import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/header/search_widget.dart';
import '../../../../../../core/resources/assets.dart';
import '../header/tab_bar_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Scroll to a specific position when the center of the screen is tapped
        _scrollController.animateTo(
          _scrollController.position.pixels + 100, // Adjust the scroll offset
          duration: const Duration(milliseconds: 300), // Animation duration
          curve: Curves.easeInOut, // Animation curve
        );
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Sliver for the header with search bar and background image
          SliverToBoxAdapter(
            child: SizedBox(
              // Wrapping Stack with a SizedBox to ensure proper layout

              child: Stack(
                children: [
                  // Full-width background image
                  Image.asset(
                    Assets.mainImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 295.h,
                    color: TextColors.darkGrey.withOpacity(.50),
                    colorBlendMode: BlendMode.hardLight,
                  ),
                  // Padding for the search row
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: _buildSearchRow(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 240.h), // Adjust space as needed
                    child: const CustomTabWidget(),
                  ),
                ],
              ),
            ),
          ),

          // Optional: Add space between header and tabs
          SliverToBoxAdapter(
              child: SizedBox(height: 16.h)), // Add spacing if necessary

          // Example SliverList for demonstration purposes
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SearchWidget(),
        Image.asset(
          Assets.filterImage,
          height: 24.h,
          width: 10.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
