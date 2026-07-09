import 'package:TalkSpace/domain/model/entities/chat_with_count_and_last_message.dart';

class StreamGetChatsResponse {
  List<ChatWithCountAndLastMessage> chats;

  StreamGetChatsResponse({
    required this.chats
  });
}