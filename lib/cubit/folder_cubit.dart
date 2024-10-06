import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/folder_api.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart';
import 'package:grpc/grpc.dart';

class GetData {
  List<Folder?> folders = [];
  List<File?> files = [];
  Map<int, Map<int, FileUpload?>> uploadFile = {};
  int status_code = 0;

  GetData(
      {required this.folders,
      required this.files,
      required this.uploadFile,
      required this.status_code});
}

class FileUpload {
  final int id;
  final String fileName;
  ResponseFuture<FileUploadResponse>? callback;

  FileUpload({required this.id, required this.fileName, this.callback});
}

class FolderCubit extends Cubit<GetData> {
  /// {@macro counter_cubit}
  FolderCubit()
      : super(GetData(folders: [], uploadFile: {}, files: [], status_code: 0));

  void updateData(GetData data) => emit(data);
  Future<GetData> updateDataFetch(int? id, BuildContext context) async {
    var data = await getFolder(id, state, context);
    emit(data);
    return data;
  }

  void setUploadFile(int? id, FileUpload data) {
    id = id ?? 0;
    if (state.uploadFile[id] == null) {
      state.uploadFile[id] = {};
    }
    state.uploadFile[id]?[data.id] = data;
    return emit(state);
  }

  void removeUploadFile(int? folderId, int id) {
    folderId = folderId ?? 0;
    state.uploadFile[folderId]?.remove(id);
    return emit(state);
  }

  void setCallbackUploadFile(int? folderId, int id, callback) {
    folderId = folderId ?? 0;
    state.uploadFile[folderId]?[id]?.callback = callback;
    return emit(state);
  }
}
