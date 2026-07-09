
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:TalkSpace/data/repository/base_grpc.dart';
import 'package:TalkSpace/data/repository/interceptors/auth_interceptor.dart';
import 'package:TalkSpace/data/sources/local/chat_secret_keys_local_data_source.dart';
import 'package:TalkSpace/domain/dto/stream_dto.dart';
import 'package:TalkSpace/domain/model/entities/message.dart' as message;
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/model/response/message/download_file_message_response.dart' as download_file_message_response;
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/gen/dart/message/message.pbgrpc.dart';
import 'package:TalkSpace/services/index.dart';

class MessageGrpc extends BaseGrpc implements MessageRepository {
  late final _stub = MessageGreeterClient(channel, interceptors: [AuthInterceptor()]);

  ChatSecretKeysLocalDataSource chatSecretKeysLocalDataSource;

  MessageGrpc({
    required this.chatSecretKeysLocalDataSource,
  });

  @override
  Future<message.Message> uploadFile(UploadFileMessageStreamRequest args) async {
    Stream<UploadFileMessageRequest> generateRoute() async* {
      List<UploadFileMessageStreamResponse> result = createStreamArg(args);

      for (final item in result) {
        yield UploadFileMessageRequest(
          chunk: item.chunk,
          fileName: item.fileName,
          chatId: item.chatId,
          fileUploaded: item.fileUploaded,
          text: item.text,
          messageId: args.messageId
        );
        args.callbackChunkUploaded(item.messageFile, item.size);
      }
    }

    var resp = await retry(() => _stub.uploadMessageFile(generateRoute()));
    return message.Message.fromGRPC(resp.message);
  }

  Future<StreamSubscription<DownloadFileMessageResponse>> _downloadFile(
      {required int chatId,
        required int messageId,
        required int fileId,
        required Function(download_file_message_response.DownloadFileMessageResponse) onData}) async {
    return await listen<DownloadFileMessageResponse>(_stub.downloadMessageFile(DownloadFileMessageRequest(
      messageId: messageId,
      chatId: chatId,
      messageFileId: fileId
    ), ), (data) {
      onData(download_file_message_response.DownloadFileMessageResponse(chunk: data.chunk, progress: data.progress));
    });
  }


  @override
  void downloadFile({
    required message.Message message,
    required MessageFile messageFile,
    required StreamDTO<double, List<int>, dynamic> streamDTO,
  }) async {
    var secretKey = chatSecretKeysLocalDataSource.getSecretKey(message.chatId) ?? "";
    List<int> chunks = [];

    var stream = await _downloadFile(
      messageId: message.id,
      fileId: messageFile.id,
      chatId: message.chatId,
      onData: (e) async {
        Uint8List list = Uint8List.fromList(e.chunk);
        chunks = [...chunks, ...crypt(false, list, secretKey.substring(0, 32))];
        streamDTO.onListen?.call(e.progress);
        if (e.progress >= 100) {
          return;
        }
      }
    );
    stream.onDone(() {
      streamDTO.onDone?.call(chunks);
    });

    stream.onError((e) {
      streamDTO.onError?.call(e);
    });
  }


  List<UploadFileMessageStreamResponse> createStreamArg(UploadFileMessageStreamRequest uploadFileMessageStream) {
    var secretKey = chatSecretKeysLocalDataSource.getSecretKey(uploadFileMessageStream.chatId)?.substring(0, 32) ?? "";

    var encryptMessage = EncryptMessage();
    var bufferSize = 256 * 1024;
    var curItem = 0;
    Map<MessageFile, List<UploadFileMessageStreamResponse>> result = {};

    String encryptText = "";
    if (uploadFileMessageStream.text != "") {
      encryptText = encryptMessage.encrypt(uploadFileMessageStream.text, secretKey).base64;
    }

      File file = uploadFileMessageStream.messageFile.uploadFileMessage!.file;
      RandomAccessFile raf = file.openSync(mode: FileMode.read);
      var bytesLength = raf.lengthSync();
      List<UploadFileMessageStreamResponse> arrFUR = [];
      String fileName = getFileName(file);
      String encryptFileName = encryptMessage.encrypt(fileName, secretKey).base64;

      for (int i = 0; i < bytesLength / bufferSize; i++) {
        raf.setPositionSync(curItem);
        Uint8List bytes = raf.readSync(bufferSize);
        curItem += bufferSize;
        arrFUR.add(UploadFileMessageStreamResponse(
          chunk: crypt(true, bytes, secretKey),
          size: curItem / bytesLength * 100,
          text: encryptText,
          chatId: uploadFileMessageStream.chatId,
          fileName: encryptFileName,
          fileUploaded: i+1 >= bytesLength / bufferSize,
          messageFile: uploadFileMessageStream.messageFile,
        ));
      }

    return arrFUR;
  }
}