import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/rating.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

class ProgramDetailsHeader extends StatelessWidget {
  const ProgramDetailsHeader({
    super.key,
    required this.activeProgramModel,
  });

  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.h,
      toolbarHeight: 0,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                activeProgramModel.imgPath ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activeProgramModel.programname ?? '',
                  style: TextStyles.font18WhiteMedium,
                ),
                10.verticalSpace,
                CustomStarRating(
                  rating:
                      double.tryParse(activeProgramModel.rateReview ?? '0.0') ??
                          0.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
