import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/proto/chat/chat.pbgrpc.dart';
import 'package:flutter_application_2/services/dh_alhoritm.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

final stub = ChatGreeterClient(channel);

CallOptions options() => CallOptions(metadata: {
      "authorization": "Bearer ${Hive.box('token').get('access_token')}",
    });

Future<CreateResponseChat> createChat(CreateRequestChat request) async {
  CreateResponseChat response =
      await stub.createChat(request, options: options());
  var p = response.keys.p;
  var g = response.keys.g;
  var chatId = response.chatId;

  var A = await generatePubKey(p, g.toInt(), chatId);
  String key = A.toString();

  createSecondaryKey(CreateSecondaryKeyRequest(chatId: chatId, key: key));
  return response;
}

Future<GetResponseChat> getChat(Empty request) async {
  GetResponseChat response = await stub.getChat(request, options: options());
  return response;
}

Future<CreateSecondaryKeyResponse> createSecondaryKey(
    CreateSecondaryKeyRequest request) async {
  CreateSecondaryKeyResponse response =
      await stub.createSecondaryKey(request, options: options());
  return response;
}

Future<GetPublicKeyResponse> getPublicKey(GetPublicKeyRequest request) async {
  GetPublicKeyResponse response =
      await stub.getPublicKey(request, options: options());
  return response;
}

Future<GetSecondaryKeyResponse> getSecondaryKey(
    GetSecondaryKeyRequest request) async {
  GetSecondaryKeyResponse response =
      await stub.getSecondaryKey(request, options: options());
  return response;
}
