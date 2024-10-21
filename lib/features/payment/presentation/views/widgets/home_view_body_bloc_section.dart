import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_failure_widget.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/payment/presentation/manager/get_program_date_and_number_cubit.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_date_and_time.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_section.dart';

class HomeViewBodyBlocSection extends StatelessWidget {
  const HomeViewBodyBlocSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProgramDateAndNumberCubit,
        GetProgramDateAndNumberState>(
      builder: (context, state) {
        if (state is GetProgramDateAndNumberLoading) {
          return const Center(child: CustomLoading());
        } else if (state is GetProgramDateAndNumberSuccess) {
          final programDateAndNumber = state.programDateAndNumber.isNotEmpty
              ? state.programDateAndNumber[0]
              : ProgramDateAndNumberModel();

          return Column(
            children: [
              BookingDateAndTime(programDateAndNumber: programDateAndNumber),
              24.verticalSpace,
              BookingSection(programDateAndNumberModel: programDateAndNumber),
            ],
          );
        } else if (state is GetProgramDateAndNumberFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
