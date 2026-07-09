import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/enums/type_message.enum.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart' as chatpb;

class StreamGetMessagesResponse {
  TypeMessage type;
  Message message;
  List<Message> messages;

  StreamGetMessagesResponse({
    required this.type,
    required this.message,
    required this.messages,
  });

  static StreamGetMessagesResponse fromGRPC(chatpb.StreamGetMessagesResponse data) {
    return StreamGetMessagesResponse(
      type: TypeMessage.values[data.type.value],
      messages: Message.listFromGRPC(data.messages),
      message: Message.fromGRPC(data.message),
    );
  }
}