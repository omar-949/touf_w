import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_image.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';

class PhotoGalleryTabBarContent extends StatelessWidget {
  const PhotoGalleryTabBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: context.read<ProgramDetailsCubit>().photoGallery!.length,
      itemBuilder: (context, index) {
        return CustomCachedNetworkImage(
          url: context.read<ProgramDetailsCubit>().photoGallery![index].image!,
          width: 200.w,
          height: 162.h,
          borderRadius: BorderRadius.circular(12),
        );
      },
    );
  }
}
