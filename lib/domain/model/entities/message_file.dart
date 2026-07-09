import 'package:TalkSpace/domain/model/entities/download_message.dart';
import 'package:TalkSpace/domain/model/entities/upload_file_message.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart' as chatpb;

class MessageFile {
  int id;
  int size;
  String fileName;
  int messageId;
  UploadFileMessage? uploadFileMessage;
  DownloadMessage? downloadMessage;

  MessageFile({
    required this.id,
    required this.size,
    required this.fileName,
    required this.messageId,
    this.uploadFileMessage,
    this.downloadMessage
  });

  static MessageFile fromGRPC(chatpb.MessageFile messageFile) {
    return MessageFile(
        id: messageFile.id,
        fileName: messageFile.fileName,
        size: messageFile.size.toInt(),
        messageId: messageFile.messageId,
    );
  }

  static List<MessageFile> listFromGRPC(List<chatpb.MessageFile> messageFiles) {
    try {
      return messageFiles.map((chatpb.MessageFile messageFile) => fromGRPC(messageFile)).toList();
    } catch (e) {
      return [];
    }
  }
}