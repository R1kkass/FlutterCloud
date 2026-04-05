import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart' as filepb;
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArgsForStream {
  final String key;
  final String file;
  final filepb.FileUploadRequest request;

  const ArgsForStream(
      {required this.file, required this.key, required this.request});
}

class ArrayStream {
  final List<int> chunk;
  final int folderId;
  final double size;
  final String fileName;

  const ArrayStream(
      {required this.chunk,
      required this.folderId,
      required this.size,
      required this.fileName});
}

class FilesGrpc extends BaseGrpc {
  late final _stub = filepb.FilesGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<StreamSubscription<filepb.FileDownloadResponse>> downloadFile(
      filepb.FileDownloadRequest request, void Function(filepb.FileDownloadResponse) onData) async {
    return await listen(_stub.downloadFile(request), onData);
  }

  Future<filepb.FileUploadResponse> uploadFile(List<ArrayStream> arrFUR) {
    Stream<filepb.FileUploadRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield filepb.FileUploadRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            folderId: item.folderId);
      }
    }

    return retry(() => _stub.uploadFile(generateRoute()));
  }

  List<ArrayStream> createStreamArg(ArgsForStream some) {
    var key = some.key;

    var file = File(some.file);
    var request = some.request;

    List<ArrayStream> arrFUR = [];
    var bufferSize = 5 * 1024 * 1024;
    var curItem = 0;
    RandomAccessFile raf = file.openSync(mode: FileMode.read);
    var bytesLength = raf.lengthSync();
    for (int i = 0; i < bytesLength / bufferSize; i++) {
      raf.setPositionSync(curItem);
      Uint8List bytes = raf.readSync(bufferSize);
      curItem += bufferSize;
      arrFUR.add(ArrayStream(
          chunk: crypt(true, bytes, key),
          folderId: request.folderId,
          size: curItem / bytesLength * 100,
          fileName: request.fileName));
    }

    return arrFUR;
  }

  Future<filepb.FindFileResponse> findFile(filepb.FindFileRequest request) {
    return retry(() => _stub.findFile(request));
  }

  Future<filepb.DeleteFileResponse> deleteFile(filepb.DeleteFileRequest request) {
    return retry(() => _stub.deleteFile(request));
  }

  Future<filepb.RenameFileResponse> renameFile(filepb.RenameFileRequest request) {
    return retry(() => _stub.renameFile(request));
  }

  Future<filepb.GetSpaceResponse> getSpace() {
    return retry(() => _stub.getSpace(filepb.GetSpaceRequest()));
  }

  Future<filepb.MoveFileResponse> grpcMoveFile(filepb.MoveFileRequest request) {
    return retry(() => _stub.moveFile(request));
  }

  moveFile(int fileId, int folderToId, int currentFolderId) async {
    try {
      await _moveFile(fileId, folderToId, currentFolderId);
    } catch (e) {
      showUnsuccessToast("Не удалось переместить файл");
    }
  }

  _moveFile(int fileId, int folderToId, int currentFolderId) async {
    final context = NavigationService.navigatorKey.currentContext!;
    await grpcMoveFile(filepb.MoveFileRequest(fileId: fileId, folderToId: folderToId));
    var response = await findFile(filepb.FindFileRequest(
        search: "", folderId: currentFolderId, findEveryWhere: false));
    context
        .read<ContentBloc>()
        .add(ContentInit(files: response.files, folders: response.folders));
    showSuccessToast("Файл перемещен");
  }
}
