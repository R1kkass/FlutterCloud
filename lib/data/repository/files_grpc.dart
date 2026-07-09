import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/domain/model/entities/file.dart' as file;
import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/domain/model/request/file/index.dart';
import 'package:TalkSpace/domain/model/response/common/with__status_message.dart';
import 'package:TalkSpace/domain/model/response/file/index.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/gen/dart/file/file.pbgrpc.dart' as filepb;
import 'package:TalkSpace/services/index.dart';
import 'package:flutter/foundation.dart';

class FilesGrpc extends BaseGrpc implements FileRepository {
  late final _stub = filepb.FilesGreeterClient(channel, interceptors: [AuthInterceptor()]);

  @override
  Future<StreamSubscription<filepb.FileDownloadResponse>> downloadFile(file.File file, void Function(FileDownloadResponse, DecodedBytes) onData) async {
    List<int> fileBytes = [];
    var decodedData = DecodedBytes();
    return await listen(_stub.downloadFile(filepb.FileDownloadRequest(
      fileId: file.id,
      folderId: file.folderId,
    )), (data) async {
      String key = HiveBoxes.token.get("password")!;
      fileBytes = [...fileBytes, ...crypt(false, Uint8List.fromList(data.chunk), key.substring(0, 32))];
      
      if (data.progress >= 100) {
        decodedData.bytes = fileBytes;
        decodedData.isDecoded = true;
      }
      onData(FileDownloadResponse(fileName: data.fileName, chunk: data.chunk, progress: data.progress), decodedData);
    });
  }

  @override
  Future<WithStatusMessage> uploadFile(List<ArrayStream> arrFUR) async {
    Stream<filepb.FileUploadRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield filepb.FileUploadRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            folderId: item.folderId);
      }
    }

    var response = await retry(() => _stub.uploadFile(generateRoute()));
    return WithStatusMessage(message: response.message);
  }

  @override
  List<ArrayStream> createStreamArg(ArgsForStream some) {
    var key = HiveBoxes.token.get("password")!;

    var file = File(some.file.path!);

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
          folderId: some.folderId,
          size: curItem / bytesLength * 100,
          fileName: some.file.name));
    }

    return arrFUR;
  }

  @override
  Future<FindCloudResponse> findFile(FindFileRequest request) async {
    var response = await retry(() => _stub.findFile(filepb.FindFileRequest(
      folderId: request.folderId,
      page: request.page,
      findEveryWhere: request.findEveryWhere,
      search: request.search,
    )));
    var files = file.File.listFromGrpc(response.files);
    var folders = Folder.listFromGrpc(response.folders);
    return FindCloudResponse(files: files, folders: folders);
  }

  @override
  Future<void> deleteFile(int fileId) async {
    await retry(() => _stub.deleteFile(filepb.DeleteFileRequest(
      fileId: fileId
    )));
  }

  @override
  Future<void> renameFile(RenameFileRequest request) async {
    await retry(() => _stub.renameFile(filepb.RenameFileRequest(
     name: request.name,
     fileId: request.fileId,
     folderId: request.folderId
    )));
  }

  @override
  Future<int> getSpace() async {
    var response = await retry(() => _stub.getSpace(filepb.GetSpaceRequest()));
    return response.space.toInt();
  }

  @override
  Future<void> moveFile({
    required int fileId,
    required int? folderToId,
  }) async {
    return retry(() => _stub.moveFile(filepb.MoveFileRequest(
      fileId: fileId,
      folderToId: folderToId,
    )));
  }
}
