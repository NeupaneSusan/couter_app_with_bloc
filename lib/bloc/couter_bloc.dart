import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement, restart }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          {
            emit(state + 1);
          }
          break;

        case CounterEvent.decrement:
          {
            emit(state - 1);
          }
          break;

        default:
          {
            emit(0);
          }
          break;
      }
    });
  }
}
