import 'dart:async';

import 'package:TalkSpace/domain/dto/stream_dto.dart';
import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';

abstract class MessageRepository {
  Future<Message> uploadFile(UploadFileMessageStreamRequest args);
  void downloadFile({
    required Message message,
    required MessageFile messageFile,
    required StreamDTO<double, List<int>, dynamic> streamDTO
  });
}

class UploadFileMessageStreamResponse {
  final List<int> chunk;
  final double size;
  final String fileName;
  final int chatId;
  final String text;
  final bool fileUploaded;
  final MessageFile messageFile;

  const UploadFileMessageStreamResponse({
    required this.chunk,
    required this.text,
    required this.size,
    required this.chatId,
    required this.fileUploaded,
    required this.fileName,
    required this.messageFile,
  });
}

class UploadFileMessageStreamRequest {
  final MessageFile messageFile;
  final int chatId;
  final int messageId;
  final String text;
  final Function(MessageFile messageFile, double percentUploadFile) callbackChunkUploaded;

  const UploadFileMessageStreamRequest({
    required this.messageFile,
    required this.text,
    required this.chatId,
    required this.messageId,
    required this.callbackChunkUploaded,
  });
}
