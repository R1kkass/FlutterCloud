import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:bloc/bloc.dart';

class TokenCubit extends Cubit<dynamic> {
  /// {@macro counter_cubit}
  TokenCubit() : super(null);

  void updateToken(dynamic data) => emit(data);
}
