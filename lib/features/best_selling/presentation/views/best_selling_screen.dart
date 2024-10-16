import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/best_selling/data/repos/home_repo_impl.dart';
import 'package:toufwshouf/features/best_selling/presentation/manager/active_program_cubit.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/best_selling_body.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) =>
            ActiveProgramCubit(getIt.get<ActiveProgramRepoImpl>())
              ..getAllActivePrograms(
                flag: 1,
              ),
        child: BestSellingBody(),
      ),
    );
  }
}
