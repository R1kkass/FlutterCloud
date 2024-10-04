import 'dart:typed_data';

import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/files/files.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class FilesGrpc {
  final _stub = FilesGreeterClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${Hive.box('token').get('access_token')}",
      });

  ResponseStream<FileDownloadResponse> downloadFile(
      FileDownloadRequest request) {
    return _stub.downloadFile(request, options: _options);
  }

  ResponseFuture<FileUploadResponse> uploadFile(
      FileUploadRequest request, Uint8List bytes, void Function(double e) fn) {
    Stream<FileUploadRequest> generateRoute() async* {
      var bufferSize = 256 * 1024;
      Uint8List chunk;
      var curItem = 0;

      for (int i = 0; i < bytes.length / bufferSize; i++) {
        if (curItem + bufferSize < bytes.length) {
          chunk = bytes.sublist(curItem, curItem + bufferSize);
        } else {
          chunk = bytes.sublist(curItem, bytes.length);
        }
        curItem += bufferSize;
        yield FileUploadRequest(
            chunk: chunk,
            folderId: request.folderId,
            fileName: request.fileName);
        fn(curItem / bytes.length * 100);
      }
    }

    return _stub.uploadFile(generateRoute(), options: _options);
  }
}
