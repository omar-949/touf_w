import 'package:flutter/material.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_app_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_body.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView({super.key, required this.appBarTitle});
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProgramDetailsAppBar(appBarTitle: appBarTitle),
      body: const ProgramDetailsBody(),
    );
  }
}
