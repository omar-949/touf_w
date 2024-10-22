import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_item.dart';

class ReviewItemListView extends StatelessWidget {
  const ReviewItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        itemCount: context.read<ProgramDetailsCubit>().reviews!.length,
        itemBuilder: (context, i) {
          return ReviewItem(
            reviews: context.read<ProgramDetailsCubit>().reviews![i],
          );
        },
      ),
    );
  }
}
