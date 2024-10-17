import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_content.dart';

import 'outings/outings_tab.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  final List<double> _heights = [920.h, 950.h, 200.h];
  double _currentHeight = 920.h;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_updateHeight);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_updateHeight);
    super.dispose();
  }

  void _updateHeight() {
    setState(() {
      _currentHeight = _heights[widget.tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _currentHeight,
      child: TabBarView(
        controller: widget.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(child: OutingsTab()),
          // SingleChildScrollView(child: Center(child: Text('Content for Hotels'))),
          SingleChildScrollView(child: HotelsContent()),
          SingleChildScrollView(child: Center(child: Text('Content for Transportation'))),
        ],
      ),
    );
  }
}
