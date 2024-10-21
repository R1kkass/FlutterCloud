import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEvent {
  const BlocEvent();
}

class CurrentPageState {
  int page = 0;


  CurrentPageState({
    required this.page,
  });
}

class CurrentPageBloc extends Bloc<BlocEvent, CurrentPageState> {
  CurrentPageBloc({required CurrentPageState state}) : super(CurrentPageState(page: state.page)) {
    on<ChangePage>(setPage);
  }

  void setPage(ChangePage event, Emitter<CurrentPageState>  emit) {
    emit(CurrentPageState(page: event.page));
  }

}


class ChangePage extends BlocEvent{
  final int page;
  const ChangePage(this.page);
}