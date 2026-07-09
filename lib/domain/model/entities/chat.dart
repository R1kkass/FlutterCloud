import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart' as chatpb;

class Chat {
  int id;
  List<Message> messages = [];
  String nameChat;
  List<User> users = [];

  Chat({
    required this.id,
    required this.nameChat,
    this.messages = const [],
    this.users = const [],
  });

  static Chat fromGRPC(chatpb.Chat chat) {
    return Chat(
        id: chat.id,
        messages: Message.listFromGRPC(chat.messages),
        nameChat: chat.nameChat,
        users: User.listFromGRPC(chat.users)
    );
  }

  static List<Chat> listFromGRPC(List<chatpb.Chat> chats) {
    return chats.map((chat) => Chat(
      id: chat.id,
      messages: Message.listFromGRPC(chat.messages),
      users: User.listFromGRPC(chat.users),
      nameChat: chat.nameChat,
    )).toList();
  }
}
