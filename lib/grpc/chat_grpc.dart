import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:flutter_application_2/services/encode_file.dart';
import 'package:flutter_application_2/services/encrypt_auth.dart';
import 'package:flutter_application_2/services/get_download_path.dart';
import 'package:flutter_application_2/services/hive_boxes.dart';
import 'package:flutter_application_2/shared/toast.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class ArrayStream {
  final List<int> chunk;
  final int messageId;
  final double size;
  final String fileName;
  final String text;

  const ArrayStream(
      {required this.chunk,
      required this.text,
      required this.messageId,
      required this.size,
      required this.fileName});
}

class ArgsForStream {
  final String secretKey;
  final String filePath;
  final UploadFileChatRequest request;

  const ArgsForStream(
      {required this.filePath, required this.secretKey, required this.request});
}

class ChatGrpc {
  final _stub = ChatGreeterClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${Hive.box('token').get('access_token')}",
      });

  Future<CreateResponseChat> createChat(CreateRequestChat request) async {
    CreateResponseChat response =
        await _stub.createChat(request, options: _options);
    var p = response.keys.p;
    var g = response.keys.g;
    var chatId = response.chatId;

    var A = await generatePubKey(p, g.toInt(), chatId);
    String key = A.toString();

    await createSecondaryKey(
        CreateSecondaryKeyRequest(chatId: chatId, key: key));
    return response;
  }

  ResponseStream<StreamGetResponseChat> streamGetChat() {
    return _stub.streamGetChat(Empty(), options: _options);
  }

  Future<GetUnSuccessChatsResponse> getUnSuccessChats() async {
    return await _stub.getUnSuccessChats(Empty(), options: _options);
  }

  Future<CreateSecondaryKeyResponse> createSecondaryKey(
      CreateSecondaryKeyRequest request) async {
    CreateSecondaryKeyResponse response =
        await _stub.createSecondaryKey(request, options: _options);
    return response;
  }

  Future<GetPublicKeyResponse> getPublicKey(GetPublicKeyRequest request) async {
    GetPublicKeyResponse response =
        await _stub.getPublicKey(request, options: _options);
    return response;
  }

  Future<GetSecondaryKeyResponse> getSecondaryKey(
      GetSecondaryKeyRequest request) async {
    GetSecondaryKeyResponse response =
        await _stub.getSecondaryKey(request, options: _options);
    return response;
  }

  Future<AcceptChatResponse> acceptChat(AcceptChatRequest request) async {
    AcceptChatResponse response =
        await _stub.acceptChat(request, options: _options);
    return response;
  }

  Future<DissalowChatResponse> dissalowChat(DissalowChatRequest request) async {
    DissalowChatResponse response =
        await _stub.dissalowChat(request, options: _options);
    return response;
  }

  Future<GetMessagesResponse> getMessages(GetMessagesRequest request) async {
    GetMessagesResponse response =
        await _stub.getMessages(request, options: _options);
    return response;
  }

  ResponseStream<StreamGetMessagesGeneralResponse> streamGetMessagesGeneral() {
    return _stub.streamGetMessagesGeneral(Empty(), options: _options);
  }

  Future<ResponseStream<StreamGetMessagesResponse>> streamGetMessages(
      Stream<StreamGetMessagesRequest> request, String chatId) async {
    return _stub.streamGetMessages(request,
        options: CallOptions(metadata: {
          "authorization": "Bearer ${Hive.box('token').get('access_token')}",
          "chat_id": chatId
        }));
  }

  ResponseFuture<UploadFileChatResponse> uploadFile(List<ArrayStream> arrFUR) {
    Stream<UploadFileChatRequest> generateRoute() async* {
      for (final item in arrFUR) {
        yield UploadFileChatRequest(
            chunk: item.chunk,
            fileName: item.fileName,
            messageId: item.messageId,
            text: item.text);
      }
    }

    return _stub.uploadChatFile(generateRoute(), options: _options);
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
          fileName: request.fileName));
    }

    return arrFUR;
  }

  ResponseStream<DownloadFileChatResponse> downloadChatFile(
      DownloadFileChatRequest request) {
    return _stub.downloadChatFile(request, options: _options);
  }

  Future<CreateFileMessageResponse> createFileMessage(
      CreateFileMessageRequest request) {
    return _stub.createFileMessage(request, options: _options);
  }

  downloadChatFileFn(BuildContext context, int chatFileId, String fileName,
      String secretKey, Function fn) {
    List<int> chunks = [];

    try {
      var downloadFile = downloadChatFile(
        DownloadFileChatRequest(
          chatFileId: chatFileId,
        ),
      );
      downloadFile.listen((e) async {
        try {
          chunks = [...chunks, ...e.chunk];

          if (e.progress >= 100) {
            var downloadPath = await getDownloadPath() ?? "";
            EncodeFile.decryptByte(Uint8List.fromList(chunks),
                "$downloadPath/$fileName", secretKey.substring(0, 32));
            HiveBoxes()
                .chatFileUploaded
                .put(chatFileId, "$downloadPath/$fileName");
            fn("$downloadPath/$fileName");
          }
        } catch (_) {
          showToast(context, 'Не удалось скачать файл: $fileName');
        }
      });
    } catch (e) {
      showToast(context, 'Не удалось скачать файл: $fileName');
    }
  }
}
