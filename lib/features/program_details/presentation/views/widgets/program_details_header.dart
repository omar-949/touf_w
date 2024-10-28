import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
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
        background: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: 'activeProgramModel.imgPath',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 280.h,
              placeholder: (context, url) => Container(
                color: AppColors.darkGrey,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blue500,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.grey500,
                child: const Icon(Icons.error),
              ),
            ),
            Container(
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
                    rating: double.tryParse(
                            activeProgramModel.rateReview ?? '0.0') ??
                        0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
