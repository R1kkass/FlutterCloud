import 'package:TalkSpace/domain/model/entities/keys.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart' as chatpb;

class CreateChatResponse {
  String text;
  int chatId;
  Keys keys;


  CreateChatResponse({
    required this.keys,
    required this.chatId,
    required this.text,
  });

  static CreateChatResponse fromGRPC(chatpb.CreateResponseChat response) {
    return CreateChatResponse(
        keys: Keys(key: response.keys.g.toString(), p: response.keys.p),
        chatId: response.chatId,
        text: response.text
    );
  }

}
