import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';

class RelatedTrips extends StatelessWidget {
  const RelatedTrips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const HomeSectionHeader(section: 'Related Trips'),
          20.verticalSpace,
        ],
      ),
    );
  }
}
