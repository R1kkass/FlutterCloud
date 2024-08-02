
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TokenCubit extends Cubit<dynamic> {
  /// {@macro counter_cubit}
  TokenCubit() : super(Hive.box('token').get('access_token'));

  void updateToken(dynamic data) => emit(data);
}
