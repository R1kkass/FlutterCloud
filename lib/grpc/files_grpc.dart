import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/cubit/content_bloc.dart';
import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/grpc/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:TalkSpace/main.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart' as filepb;
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';

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


  ResponseStream<filepb.FileDownloadResponse> downloadFile(
      filepb.FileDownloadRequest request) {
    return _stub.downloadFile(request, options: options);
  }

  ResponseFuture<filepb.FileUploadResponse> uploadFile(List<ArrayStream> arrFUR) {
    Stream<filepb.FileUploadRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield filepb.FileUploadRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            folderId: item.folderId);
      }
    }

    return _stub.uploadFile(generateRoute(), options: options);
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
    return _stub.findFile(request, options: options);
  }

  Future<filepb.DeleteFileResponse> deletefile(filepb.DeleteFileRequest request) {
    return _stub.deleteFile(request, options: options);
  }

  Future<filepb.RenameFileResponse> renameFile(filepb.RenameFileRequest request) {
    return _stub.renameFile(request, options: options);
  }

  ResponseFuture<filepb.GetSpaceResponse> getSpace() {
    return _stub.getSpace(filepb.GetSpaceRequest(), options: options);
  }

  ResponseFuture<filepb.MoveFileResponse> grpcMoveFile(filepb.MoveFileRequest request) {
    return _stub.moveFile(request, options: options);
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
