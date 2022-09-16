import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrease) {
        counter += 1;
        emit(CounterValueChange(counter: counter));
      } else if (event is CounterDecrease) {
        counter -= 1;
        emit(CounterValueChange(counter: counter));
      } else {
        counter = 0;
        emit(CounterValueChange(counter: counter));
      }
    });
  }
}
