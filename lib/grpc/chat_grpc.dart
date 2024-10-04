import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

class ChatGrpc {
  final _stub = ChatGreeterClient(channel);

  CallOptions get _options => CallOptions(metadata: {
        "authorization": "Bearer ${Hive.box('token').get('access_token')}",
      });

  Future<CreateResponseChat> createChat(CreateRequestChat request) async {
    CreateResponseChat response =
        await _stub.createChat(request, options: _options);
    var p = response.keys.p;
    var g = response.keys.g;
    var chatId = response.chatId;

    var A = await generatePubKey(p, g.toInt(), chatId);
    String key = A.toString();

    await createSecondaryKey(
        CreateSecondaryKeyRequest(chatId: chatId, key: key));
    return response;
  }

  Future<GetResponseChat> getChat(GetRequestChat request) async {
    GetResponseChat response = await _stub.getChat(request, options: _options);
    return response;
  }

  Future<CreateSecondaryKeyResponse> createSecondaryKey(
      CreateSecondaryKeyRequest request) async {
    CreateSecondaryKeyResponse response =
        await _stub.createSecondaryKey(request, options: _options);
    return response;
  }

  Future<GetPublicKeyResponse> getPublicKey(GetPublicKeyRequest request) async {
    GetPublicKeyResponse response =
        await _stub.getPublicKey(request, options: _options);
    return response;
  }

  Future<GetSecondaryKeyResponse> getSecondaryKey(
      GetSecondaryKeyRequest request) async {
    GetSecondaryKeyResponse response =
        await _stub.getSecondaryKey(request, options: _options);
    return response;
  }

  Future<AcceptChatResponse> acceptChat(AcceptChatRequest request) async {
    AcceptChatResponse response =
        await _stub.acceptChat(request, options: _options);
    return response;
  }

  Future<DissalowChatResponse> dissalowChat(DissalowChatRequest request) async {
    DissalowChatResponse response =
        await _stub.dissalowChat(request, options: _options);
    return response;
  }
}
