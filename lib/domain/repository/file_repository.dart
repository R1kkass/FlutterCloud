import 'dart:async';

import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/request/file/index.dart';
import 'package:TalkSpace/domain/model/response/file/index.dart';
import 'package:TalkSpace/domain/model/response/common/with__status_message.dart';
import 'package:file_picker/file_picker.dart';

abstract class FileRepository {
  Future<StreamSubscription<dynamic>> downloadFile(File file, void Function(FileDownloadResponse, DecodedBytes) onData);

  Future<WithStatusMessage> uploadFile(List<ArrayStream> arrFUR);

  List<ArrayStream> createStreamArg(ArgsForStream some);

  Future<FindCloudResponse> findFile(FindFileRequest request);

  Future<void> deleteFile(int fileId);

  Future<void> renameFile(RenameFileRequest request);

  Future<int> getSpace();

  Future<void> moveFile({
    required int fileId,
    required int? folderToId,
  });
}

class ArgsForStream {
  final int? folderId;
  final PlatformFile file;

  const ArgsForStream({
    required this.file,
    required this.folderId,
  });
}

class ArrayStream {
  final List<int> chunk;
  final int? folderId;
  final double size;
  final String fileName;

  ArrayStream({
    required this.folderId,
    required this.chunk,
    required this.size,
    required this.fileName,
  });
}

class DecodedBytes {
  bool isDecoded = false;
  List<int> bytes = [];
}
