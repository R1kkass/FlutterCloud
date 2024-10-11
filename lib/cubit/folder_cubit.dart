import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/proto/files/files.pb.dart';
import 'package:flutter_application_2/proto/users/users.pb.dart' as user;
import 'package:grpc/grpc.dart';

class GetData {
  List<user.Folder?> folders = [];
  List<user.File?> files = [];
  Map<int, Map<int, FileUpload?>> uploadFile = {};
  Map<int, FileDownload?> downloadFile = {};
  int status_code = 0;

  GetData(
      {required this.folders,
      required this.files,
      required this.downloadFile,
      required this.uploadFile,
      required this.status_code});
}

class FileUpload {
  final int id;
  final String fileName;
  double size;
  ResponseFuture<FileUploadResponse>? callback;

  FileUpload(
      {required this.id,
      required this.fileName,
      required this.size,
      this.callback});
}

enum FileDownloadStatus { waiting, downloading, suceess, reject }

class FileDownload {
  FileDownloadStatus status;
  final String fileName;
  final int folderId;
  final String path;
  double size;
  ResponseStream<FileDownloadResponse>? callback;

  FileDownload(
      {required this.fileName,
      required this.size,
      required this.callback,
      required this.folderId,
      required this.path,
      required this.status});
}

class FolderCubit extends Cubit<GetData> {
  /// {@macro counter_cubit}
  FolderCubit()
      : super(GetData(
            folders: [],
            uploadFile: {},
            files: [],
            status_code: 0,
            downloadFile: {}));

  // void updateData(GetData data) => emit(data);
  // Future<GetData> updateDataFetch(int? id, BuildContext context) async {
  //   var data = await getFolder(id, state, context);
  //   emit(data);
  //   return data;
  // }

  void setSizeUploadFile(int? folderId, int id, double size) {
    folderId = folderId ?? 0;
    state.uploadFile[folderId]?[id]?.size = size;
  }
}
