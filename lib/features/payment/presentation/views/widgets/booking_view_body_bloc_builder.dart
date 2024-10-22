import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_failure_widget.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/payment/presentation/manager/payment_cubit.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/booking_date_and_time.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/booking_section.dart';

class BookingViewBodyBlocBuilder extends StatelessWidget {
  const BookingViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      if (state is PaymentLoading) {
        return const CustomLoading();

      } else if (state is PaymentSuccess) {
        return Column(
          children: [
            BookingDateAndTime(
                programDateAndNumber: state.programDateAndNumber.first),
            24.verticalSpace,
           BookingSection(
               extraServices: state.extraPrograms,
               peopleCount: state.programDateAndNumber.first.paxAval ?? 0,
               programGroupModel: state.programGroups
           )
          ],
        );
      }
      else if (state is PaymentFailure) {
        return CustomFailureWidget(errMessage: state.errMessage);
      }
      else {
        return const Center(child:  Text("undefined error"));
      }
    });
  }
}
