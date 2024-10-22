import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/payment/data/repos/payment_repo/payment_repo_impl.dart';
import 'package:toufwshouf/features/payment/presentation/manager/payment_cubit.dart';
import 'package:toufwshouf/features/payment/presentation/manager/total_cubit.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.activeProgramModel});

  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymentCubit(getIt.get<PaymentRepoImpl>())
            ..getPaymentData(
                programCode: activeProgramModel.code.toString(),
                programYear: activeProgramModel.programyear.toString()),
        ),
        BlocProvider(create: (_) => TotalCubit()),
      ],
      child: Scaffold(
        body: PaymentViewBody(
          activeProgramModel: activeProgramModel,
        ),
      ),
    );
  }
}
