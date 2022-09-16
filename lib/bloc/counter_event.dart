part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrease extends CounterEvent {}

class CounterDecrease extends CounterEvent {}

class CounterReset extends CounterEvent {}
