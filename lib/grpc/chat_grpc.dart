import 'dart:async';

import 'package:TalkSpace/grpc/base_grpc.dart';
import 'package:TalkSpace/gen/dart/chat/chat.pbgrpc.dart';
import 'package:TalkSpace/services/dh_algoritm.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:grpc/grpc.dart';

import 'interceptors/auth_interceptor.dart';

class ChatGrpc extends BaseGrpc {
  late final _stub = ChatGreeterClient(channel, interceptors: [AuthInterceptor()]);

  Future<CreateResponseChat> createChat(CreateRequestChat request) async {
    CreateResponseChat response =
        await _stub.createChat(request, options: options);
    var p = response.keys.p;
    var g = response.keys.g;
    var chatId = response.chatId;

    var A = await DHAlgorithm.generatePubKey(p, g.toInt(), chatId);
    String key = A.toString();

    await createSecondaryKey(
        CreateSecondaryKeyRequest(chatId: chatId, key: key));
    return response;
  }

  ResponseStream<StreamGetResponseChat> streamGetChat() {
    return _stub.streamGetChat(Empty(), options: options);
  }

  Future<GetUnSuccessChatsResponse> getUnSuccessChats() async {
    var response = await _stub.getUnSuccessChats(Empty(), options: options);
    return response;
  }

  Future<CreateSecondaryKeyResponse> createSecondaryKey(
      CreateSecondaryKeyRequest request) async {
    CreateSecondaryKeyResponse response =
        await _stub.createSecondaryKey(request, options: options);
    return response;
  }

  Future<GetPublicKeyResponse> getPublicKey(GetPublicKeyRequest request) async {
    GetPublicKeyResponse response =
        await _stub.getPublicKey(request, options: options);
    return response;
  }

  Future<GetSecondaryKeyResponse> getSecondaryKey(
      GetSecondaryKeyRequest request) async {
    GetSecondaryKeyResponse response =
        await _stub.getSecondaryKey(request, options: options);
    return response;
  }

  Future<AcceptChatResponse> acceptChat(AcceptChatRequest request) async {
    AcceptChatResponse response =
        await _stub.acceptChat(request, options: options);
    return response;
  }

  Future<DisallowChatResponse> disallowChat(DisallowChatRequest request) async {
    DisallowChatResponse response =
        await _stub.disallowChat(request, options: options);
    return response;
  }

  Future<GetMessagesResponse> getMessages(GetMessagesRequest request) async {
    GetMessagesResponse response =
        await _stub.getMessages(request, options: options);
    return response;
  }

  ResponseStream<StreamGetMessagesGeneralResponse> streamGetMessagesGeneral() {
    return _stub.streamGetMessagesGeneral(Empty(), options: options);
  }

  Future<ResponseStream<StreamGetMessagesResponse>> streamGetMessages(
      Stream<StreamGetMessagesRequest> request, String chatId) async {
    return _stub.streamGetMessages(request,
        options: CallOptions(metadata: {
          "authorization": "Bearer ${HiveBoxes.token.get('access_token')}",
          "chat_id": chatId
        }));
  }


}
