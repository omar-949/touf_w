import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'outings/outings_tab.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      child: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          OutingsTab(),
          Center(child: Text('Content for Hotels')),
          Center(child: Text('Content for Transportation')),
        ],
      ),
    );
  }
}
