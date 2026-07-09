import 'package:TalkSpace/domain/model/entities/chat.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart' as chatpb;

class UnSuccessChatsResponse {
  List<Chat> chats;

  UnSuccessChatsResponse({
    required this.chats
  });

  static UnSuccessChatsResponse fromGRPC(chatpb.GetUnSuccessChatsResponse response) {
    return UnSuccessChatsResponse(chats: Chat.listFromGRPC(response.chats));
  }
}
