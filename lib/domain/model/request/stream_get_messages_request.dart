import 'package:TalkSpace/domain/model/enums/type_message.enum.dart';

class StreamGetMessagesRequest {
  TypeMessage type;
  String text;
  int messageId;

  StreamGetMessagesRequest({
    required this.type,
    this.text = "",
    this.messageId = 0,
  });
}