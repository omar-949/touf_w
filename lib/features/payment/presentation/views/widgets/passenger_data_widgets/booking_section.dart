import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/presentation/manager/total_cubit.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/booking_details_additional_widget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/number_of_people_widget.dart';
import '../../../../../../core/resources/styles.dart';

class BookingSection extends StatelessWidget {
  final List<ProgramGroupModel> programGroupModel;
  final List<ExtraModel> extraServices;
  final int peopleCount;
  const BookingSection({
    super.key,
    required this.extraServices,
    required this.peopleCount,
    required this.programGroupModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberOfPeopleWidget(
          onUpdate: () {
            context.read<TotalCubit>().updateTotal(extraServices, programGroupModel);
          },
          title: "Number of People",
          people: programGroupModel,
          count: peopleCount
        ),
        SizedBox(height: 16.h),
        BookingDetailsAdditionalWidget(
          onUpdate: () {
            context
                .read<TotalCubit>()
                .updateTotal(extraServices, programGroupModel);
          },
          additionalServices: extraServices,
        ),
        SizedBox(height: 16.h),
        BlocBuilder<TotalCubit, TotalState>(
          builder: (context, state) {
            double total = 0.0;
            if (state is TotalUpdated) {
              total = state.total;
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyles.font24darkGreymedium),
                  Text("${total.toStringAsFixed(2)} EGP",
                      style: TextStyles.font24darkGreymedium),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
