import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/files/files.pbgrpc.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class ArgsForStream {
  final String key;
  final String file;
  final FileUploadRequest request;

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

class FilesGrpc {
  final _stub = FilesGreeterClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${Hive.box('token').get('access_token')}",
      });

  ResponseStream<FileDownloadResponse> downloadFile(
      FileDownloadRequest request) {
    return _stub.downloadFile(request, options: _options);
  }

  ResponseFuture<FileUploadResponse> uploadFile(List<ArrayStream> arrFUR) {
    Stream<FileUploadRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield FileUploadRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            folderId: item.folderId);
      }
    }

    return _stub.uploadFile(generateRoute(), options: _options);
  }

  List<ArrayStream> createStreamArg(ArgsForStream some) {
    var key = some.key;

    var file = File(some.file);
    var request = some.request;

    List<ArrayStream> arrFUR = [];
    var bufferSize = 256 * 1024;
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
}
