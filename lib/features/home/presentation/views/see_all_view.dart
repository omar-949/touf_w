import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_app_bar.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeeAllAppBar(title: title),
      body: SeeAllBody(),
    );
  }
}
