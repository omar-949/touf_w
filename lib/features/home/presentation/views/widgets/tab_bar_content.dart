import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_content.dart';

import 'outings/outings_tab.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      child: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OutingsTab(),
          HotelsContent(),
          // Center(child: Text('Content for Hotels')),
          Center(child: Text('Content for Transportation')),
        ],
      ),
    );
  }
}
