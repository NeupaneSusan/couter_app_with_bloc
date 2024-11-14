import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../container.dart';

class ColorEvent {
  final Color data;
  ColorEvent(this.data);
}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(colors[0]) {
    on<ColorEvent>((event, emit) {
      emit(event.data);
    });
  }
}
