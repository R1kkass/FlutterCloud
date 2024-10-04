import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/folder_api.dart';

class FolderCubit extends Cubit<GetData> {
  /// {@macro counter_cubit}
  FolderCubit() : super(GetData(null, 0));

  void updateData(GetData data) => emit(data);
  Future<GetData> updateDataFetch(int? id, BuildContext context) async {
    var data = await getFolder(id, context);
    emit(data);
    return data;
  }
}
