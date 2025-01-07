import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:bloc/bloc.dart';

class TokenCubit extends Cubit<dynamic> {
  /// {@macro counter_cubit}
  TokenCubit() : super(HiveBoxes.token.get('access_token'));

  void updateToken(dynamic data) => emit(data);
}
