part of 'tab_bar_cubit.dart';

@immutable
sealed class TabBarState {}

final class TabBarInitial extends TabBarState {}

final class TabBarIndexUpdated extends TabBarState {
  final int index ;

  TabBarIndexUpdated(this.index);
}
