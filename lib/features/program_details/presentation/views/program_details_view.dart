import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/repos/program_details_repo/program_details_repo_impl.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/details_tab_bar_cubit/details_tab_bar_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/review_cubit/review_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_app_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_body.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView(
      {super.key, required this.appBarTitle, required this.program});

  final String appBarTitle;
  final ActiveProgramModel program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProgramDetailsAppBar(appBarTitle: appBarTitle),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProgramDetailsCubit(getIt.get<ProgramDetailsRepoImpl>())
                  ..fetchAllProgramDetails(
                    programCode: program.code.toString(),
                    programYear: program.programyear.toString(),
                    languageCode: program.languageCode.toString(),
                  ),
          ),
          BlocProvider(
            create: (context) => ReviewCubit(
              getIt.get<ProgramDetailsRepoImpl>(),
            ),
          ),
          BlocProvider(create: (context) => DetailsTabBarCubit()),
        ],
        child: ProgramDetailsBody(activeProgramModel: program),
      ),
    );
  }
}
