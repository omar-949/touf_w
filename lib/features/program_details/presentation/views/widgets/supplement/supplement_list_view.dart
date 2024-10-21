import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/supplement_model/supplements_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_list_view_item.dart';

class SupplementListView extends StatelessWidget {
  const SupplementListView({super.key, required this.supplements});
  final List<SupplementsModel> supplements;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0.h),
            child:  SupplementListViewItem(
              desc: supplements[index].thePriceIncludesSupplement??'',
              price: 1200,
            ),
          );
        },
        itemCount: supplements.length,
      ),
    );
  }
}
