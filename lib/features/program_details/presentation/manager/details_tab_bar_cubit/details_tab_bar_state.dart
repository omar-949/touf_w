part of 'details_tab_bar_cubit.dart';

@immutable
sealed class DetailsTabBarState {}

final class DetailsTabBarInitial extends DetailsTabBarState {}

final class DetailsTabBarIndexUpdated extends DetailsTabBarState {
  final int index;
  DetailsTabBarIndexUpdated(this.index);
}