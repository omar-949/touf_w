import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_list_view_item.dart';

import '../../../manager/program_details_cubit.dart';

class SupplementListView extends StatelessWidget {
  const SupplementListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child:  SupplementListViewItem(
            desc: context.read<ProgramDetailsCubit>().supplements![index].thePriceIncludesSupplement??'No Data',
            price: 1200,
          ),
        );
      },
      itemCount: context.read<ProgramDetailsCubit>().supplements!.length,
    );
  }
}
