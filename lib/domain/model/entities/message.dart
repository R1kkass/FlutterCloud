import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/domain/model/enums/message_status_enum.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart' as chatpb;

class Message {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int chatId;
  String text;
  final User user;
  bool statusRead;
  List<MessageFile> messageFiles = [];
  MessageStatusEnum status;

  Message({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.text,
    required this.chatId,
    required this.statusRead,
    this.messageFiles = const [],
    this.status = MessageStatusEnum.success
  });

  static List<Message> listFromGRPC(List<chatpb.Message> messages) {
    List<Message> result = [];
    for (var message in messages) {
      result.add(fromGRPC(message));
    }
    return result;
  }

  static fromGRPC(chatpb.Message message) {
    var msg = Message(
        id: message.id,
        createdAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt.seconds.toInt() * 1000),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(message.updatedAt.seconds.toInt() * 1000),
        user: User.fromGRPC(message.user),
        text: message.text,
        chatId: message.chatId,
        statusRead: message.statusRead,
    );

    if (message.messageFiles.isNotEmpty) {
      msg.messageFiles = MessageFile.listFromGRPC(message.messageFiles);
    }
    return msg;
  }
}
