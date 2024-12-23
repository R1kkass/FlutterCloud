import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEvent {
  const BlocEvent();
}

class RegistrationState {
  RegistrationState({
    required this.email,
    required this.password,
    required this.secretKey,
  });

  String? password;
  String? email;
  String? secretKey;
}

class RegistrationBloc extends Bloc<BlocEvent, RegistrationState> {
  RegistrationBloc({required RegistrationState state})
      : super(RegistrationState(
            email: state.email,
            password: state.password,
            secretKey: state.secretKey)) {
    on<AddFields>(_addFields);
  }

  _addFields(AddFields event, Emitter<RegistrationState> emit) {
    emit(RegistrationState(
        email: event.email,
        password: event.password,
        secretKey: event.secretKey));
  }
}

class AddFields extends BlocEvent {
  AddFields({
    required this.email,
    required this.password,
    required this.secretKey,
  });

  String? password;
  String? email;
  String? secretKey;
}
