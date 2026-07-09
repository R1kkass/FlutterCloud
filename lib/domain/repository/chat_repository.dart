import 'dart:async';

import 'package:TalkSpace/domain/model/entities/keys.dart';
import 'package:TalkSpace/domain/model/response/chat/create_chat_response.dart';
import 'package:TalkSpace/domain/model/request/get_messages_request.dart';
import 'package:TalkSpace/domain/model/response/chat/get_messages_response.dart';
import 'package:TalkSpace/domain/model/response/chat/stream_get_chats_response.dart';
import 'package:TalkSpace/domain/model/response/chat/stream_get_messages_response.dart';
import 'package:TalkSpace/domain/model/response/chat/un_success_chats_response.dart';
import 'package:TalkSpace/domain/repository/chat_message_manager.dart';

abstract class ChatRepository {
  Future<CreateChatResponse> createChat(String companionUUID);

  Future<StreamSubscription<dynamic>> streamGetChat(void Function(StreamGetChatsResponse) onData);

  Future<UnSuccessChatsResponse> getUnSuccessChats();

  Future<void> createSecondaryKey(int chatId, String key);

  Future<Keys> getPublicKey(int chatId);

  Future<Keys> getSecondaryKey(int chatId);

  Future<void> acceptChat(int chatId);

  Future<void> disallowChat(int chatId);

  Future<GetMessagesResponse> getMessages(GetMessagesRequest request);

  Future<StreamSubscription> streamGetMessagesGeneral(void Function(int) onData);

  Future<ChatMessageManager> streamGetMessages(int chatId, void Function(StreamGetMessagesResponse) onData);

  Future<void> createSecretChatKey(int chatId);
}
