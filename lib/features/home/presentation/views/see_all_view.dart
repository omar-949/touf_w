import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:toufwshouf/features/home/presentation/manager/active_program_cubit/active_program_cubit.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_app_bar.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeeAllAppBar(title: title),
      body: BlocProvider(
        create: (context) => ActiveProgramCubit(getIt.get<HomeRepoImpl>())
          ..getAllActivePrograms(),
        child: const SeeAllBody(),
      ),
    );
  }
}
