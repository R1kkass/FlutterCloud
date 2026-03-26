
import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart';
import 'package:TalkSpace/gen/dart/message/message.pbgrpc.dart';
import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/grpc/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/services/encode_file.dart';
import 'package:TalkSpace/services/encrypt_auth.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:TalkSpace/shared/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

class ArrayStream {
  final List<int> chunk;
  final int messageId;
  final double size;
  final String fileName;
  final int chatId;
  final String text;

  const ArrayStream(
      {required this.chunk,
        required this.text,
        required this.messageId,
        required this.size,
        required this.chatId,
        required this.fileName});
}

class ArgsForStream {
  final String secretKey;
  final String filePath;
  final UploadFileMessageRequest request;

  const ArgsForStream(
      {required this.filePath, required this.secretKey, required this.request});
}

class MessageGrpc extends BaseGrpc {
  late final _stub = MessageGreeterClient(channel, interceptors: [AuthInterceptor()]);

  ResponseFuture<UploadFileMessageResponse> uploadFile(List<ArrayStream> arrFUR) {
    Stream<UploadFileMessageRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield UploadFileMessageRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            messageId: item.messageId,
            chatId: item.chatId,
            text: item.text);
      }
    }

    return _stub.uploadMessageFile(generateRoute(), options: options);
  }

  ResponseStream<DownloadFileMessageResponse> downloadFile(
      DownloadFileMessageRequest request) {
    return _stub.downloadMessageFile(request, options: options);
  }

  Future<CreateFileMessageResponse> createFileMessage(
      CreateFileMessageRequest request) {
    return _stub.createFileMessage(request, options: options);
  }


  downloadFileFn(BuildContext context, Message message, int messageFileId, String fileName,
      String secretKey, Function(String) fn) {
    List<int> chunks = [];
    try {
      var downloadFile = this.downloadFile(
        DownloadFileMessageRequest(
          messageId: message.id,
          messageFileId: messageFileId,
          chatId: message.chatId
        ),
      );
      downloadFile.listen((e) async {
        try {
          chunks = [...chunks, ...e.chunk];

          if (e.progress >= 100) {
            var downloadPath = await getDownloadPath() ?? "";
            var path = "$downloadPath/$fileName";
            var file = EncodeFile.decryptByteCreateFile(
                Uint8List.fromList(chunks), path, secretKey.substring(0, 32));

            await HiveBoxes.chatFileUploaded.put(
              "$messageFileId${jwtDecode().email}",
              file.path,
            );

            await fn(
              path,
            );
          }
        } catch (_) {
          showUnsuccessToast('Не удалось скачать файл: $fileName');
        }
      });
    } catch (e) {
      showUnsuccessToast('Не удалось скачать файл: $fileName');
    }
  }


  List<ArrayStream> createStreamArg(ArgsForStream some) {
    var key = some.secretKey;

    var file = File(some.filePath);
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
          messageId: request.messageId,
          size: curItem / bytesLength * 100,
          text: request.text,
          chatId: request.chatId,
          fileName: request.fileName));
    }

    return arrFUR;
  }
}