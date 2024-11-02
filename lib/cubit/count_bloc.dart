import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEvent {
  const BlocEvent();
}

class CountState {
  int count;
  CountState({required this.count});
}

class CountBloc extends Bloc<BlocEvent, CountState> {
  CountBloc({required CountState state})
      : super(CountState(count: state.count)) {
    on<SetCount>(_setCount);
  }

  _setCount(SetCount event, Emitter<CountState> emit) {
    emit(CountState(count: event.count));
  }
}

class SetCount extends BlocEvent {
  int count;
  SetCount(this.count);
}
