import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/appbar_widget.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(),
      body: HomeBody(),
    );
  }
}