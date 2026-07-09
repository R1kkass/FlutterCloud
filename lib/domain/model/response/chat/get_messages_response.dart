import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pb.dart' as chatpb;

class GetMessagesResponse {
  List<Message> messages;
  int countNotRead;
  int page;

  GetMessagesResponse({
    required this.messages,
    required this.countNotRead,
    required this.page,
  });

  static GetMessagesResponse fromGRPC(chatpb.GetMessagesResponse response) {
    return GetMessagesResponse(messages: Message.listFromGRPC(response.messages), countNotRead: response.countNotRead, page: response.page);
  }
}
