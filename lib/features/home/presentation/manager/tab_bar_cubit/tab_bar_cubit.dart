import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit() : super(TabBarIndexUpdated(0));

  void changeTab(int index) {
    emit(TabBarIndexUpdated(index));
  }
}
