import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/overview_tab_bar_content.dart';

class DetailsTabBarContent extends StatefulWidget {
  const DetailsTabBarContent({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<DetailsTabBarContent> createState() => _DetailsTabBarContentState();
}

class _DetailsTabBarContentState extends State<DetailsTabBarContent> {
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
          OverviewTabBarContent(),
          Center(
            child: Text('Supplement'),
          ),
          Center(
            child: Text('Photo Gallery'),
          ),
        ],
      ),
    );
  }
}
