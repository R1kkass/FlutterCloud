import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart' as chatpb;

class ChatWithCountAndLastMessage extends Chat {
  Message message;
  int unReadingMessagesCount;

  ChatWithCountAndLastMessage({
    super.messages,
    super.users,
    required super.id,
    required this.message,
    required super.nameChat,
    required this.unReadingMessagesCount,
  });

  static ChatWithCountAndLastMessage fromGrpc(chatpb.ChatWithUnReadingMessagesCount chat) {
    return ChatWithCountAndLastMessage(
        id: chat.id,
        message: Message.fromGRPC(chat.message),
        nameChat: chat.nameChat,
        users: User.listFromGRPC(chat.users),
        unReadingMessagesCount: chat.unReadingMessagesCount,
    );
  }

  static List<ChatWithCountAndLastMessage> listFromGrpc(List<chatpb.ChatWithUnReadingMessagesCount> chats) {
    return chats.map((chat) {
      return fromGrpc(chat);
    }).toList();
  }
}