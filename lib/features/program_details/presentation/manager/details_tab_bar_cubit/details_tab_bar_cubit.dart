

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_tab_bar_state.dart';

class DetailsTabBarCubit extends Cubit<DetailsTabBarState> {
  DetailsTabBarCubit() : super(DetailsTabBarIndexUpdated(0));
  void changeTab(int index) {
    emit(DetailsTabBarIndexUpdated(index));
  }
}
