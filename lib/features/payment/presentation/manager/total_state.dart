part of 'total_cubit.dart';

@immutable
abstract class TotalState {}

class TotalInitial extends TotalState {}

class TotalUpdated extends TotalState {
  final double total;

  TotalUpdated(this.total);

  @override
  List<Object> get props => [total];
}
