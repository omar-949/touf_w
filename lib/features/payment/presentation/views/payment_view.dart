import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/payment/data/repos/payment_repo/payment_repo_impl.dart';
import 'package:toufwshouf/features/payment/presentation/manager/get_program_date_and_number_cubit.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProgramDateAndNumberCubit(getIt.get<PaymentRepoImpl>())..getProgramDateAndNumber(programCode: '4', programYear: '2024'),
        ),
      ],
      child: const Scaffold(
        body: PaymentViewBody(),
      ),
    );
  }
}
