part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int counter = 0;
}

class CounterValueChange extends CounterState {
  final int counter;

  CounterValueChange({required this.counter});
}
