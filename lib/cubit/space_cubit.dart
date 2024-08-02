
import 'package:bloc/bloc.dart';

class SpaceCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  SpaceCubit() : super(0);

  void updateSpace(int data) => emit(data);
}
