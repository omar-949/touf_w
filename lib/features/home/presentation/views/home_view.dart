import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/home/presentation/manager/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_body.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repos/home_repo/home_repo_impl.dart';
import '../manager/active_program_cubit/active_program_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ActiveProgramCubit(getIt.get<HomeRepoImpl>())
              ..getAllActivePrograms(),
          ),
          BlocProvider(create: (context) => TabBarCubit()),
        ],
        child: const HomeBody(),
      ),
    );
  }
}
