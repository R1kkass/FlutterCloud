//
//  Generated code. Do not modify.
//  source: chat/chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pb.dart' as $1;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatGreeter')
class ChatGreeterClient extends $grpc.Client {
  static final _$createChat = $grpc.ClientMethod<$1.CreateRequestChat, $1.CreateResponseChat>(
      '/chat.ChatGreeter/CreateChat',
      ($1.CreateRequestChat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateResponseChat.fromBuffer(value));
  static final _$streamGetChat = $grpc.ClientMethod<$1.Empty, $1.StreamGetResponseChat>(
      '/chat.ChatGreeter/StreamGetChat',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StreamGetResponseChat.fromBuffer(value));
  static final _$createSecondaryKey = $grpc.ClientMethod<$1.CreateSecondaryKeyRequest, $1.CreateSecondaryKeyResponse>(
      '/chat.ChatGreeter/CreateSecondaryKey',
      ($1.CreateSecondaryKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CreateSecondaryKeyResponse.fromBuffer(value));
  static final _$getSecondaryKey = $grpc.ClientMethod<$1.GetSecondaryKeyRequest, $1.GetSecondaryKeyResponse>(
      '/chat.ChatGreeter/GetSecondaryKey',
      ($1.GetSecondaryKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetSecondaryKeyResponse.fromBuffer(value));
  static final _$getPublicKey = $grpc.ClientMethod<$1.GetPublicKeyRequest, $1.GetPublicKeyResponse>(
      '/chat.ChatGreeter/GetPublicKey',
      ($1.GetPublicKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetPublicKeyResponse.fromBuffer(value));
  static final _$acceptChat = $grpc.ClientMethod<$1.AcceptChatRequest, $1.AcceptChatResponse>(
      '/chat.ChatGreeter/AcceptChat',
      ($1.AcceptChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AcceptChatResponse.fromBuffer(value));
  static final _$disallowChat = $grpc.ClientMethod<$1.DisallowChatRequest, $1.DisallowChatResponse>(
      '/chat.ChatGreeter/DisallowChat',
      ($1.DisallowChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DisallowChatResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$1.GetMessagesRequest, $1.GetMessagesResponse>(
      '/chat.ChatGreeter/GetMessages',
      ($1.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetMessagesResponse.fromBuffer(value));
  static final _$streamGetMessagesGeneral = $grpc.ClientMethod<$1.Empty, $1.StreamGetMessagesGeneralResponse>(
      '/chat.ChatGreeter/StreamGetMessagesGeneral',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StreamGetMessagesGeneralResponse.fromBuffer(value));
  static final _$streamGetMessages = $grpc.ClientMethod<$1.StreamGetMessagesRequest, $1.StreamGetMessagesResponse>(
      '/chat.ChatGreeter/StreamGetMessages',
      ($1.StreamGetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StreamGetMessagesResponse.fromBuffer(value));
  static final _$getUnSuccessChats = $grpc.ClientMethod<$1.Empty, $1.GetUnSuccessChatsResponse>(
      '/chat.ChatGreeter/GetUnSuccessChats',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetUnSuccessChatsResponse.fromBuffer(value));

  ChatGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateResponseChat> createChat($1.CreateRequestChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChat, request, options: options);
  }

  $grpc.ResponseStream<$1.StreamGetResponseChat> streamGetChat($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetChat, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$1.CreateSecondaryKeyResponse> createSecondaryKey($1.CreateSecondaryKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSecondaryKey, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetSecondaryKeyResponse> getSecondaryKey($1.GetSecondaryKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSecondaryKey, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetPublicKeyResponse> getPublicKey($1.GetPublicKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPublicKey, request, options: options);
  }

  $grpc.ResponseFuture<$1.AcceptChatResponse> acceptChat($1.AcceptChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acceptChat, request, options: options);
  }

  $grpc.ResponseFuture<$1.DisallowChatResponse> disallowChat($1.DisallowChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disallowChat, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetMessagesResponse> getMessages($1.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseStream<$1.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetMessagesGeneral, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$1.StreamGetMessagesResponse> streamGetMessages($async.Stream<$1.StreamGetMessagesRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetMessages, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetUnSuccessChatsResponse> getUnSuccessChats($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUnSuccessChats, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatGreeter')
abstract class ChatGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatGreeter';

  ChatGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateRequestChat, $1.CreateResponseChat>(
        'CreateChat',
        createChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateRequestChat.fromBuffer(value),
        ($1.CreateResponseChat value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.StreamGetResponseChat>(
        'StreamGetChat',
        streamGetChat_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.StreamGetResponseChat value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateSecondaryKeyRequest, $1.CreateSecondaryKeyResponse>(
        'CreateSecondaryKey',
        createSecondaryKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateSecondaryKeyRequest.fromBuffer(value),
        ($1.CreateSecondaryKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetSecondaryKeyRequest, $1.GetSecondaryKeyResponse>(
        'GetSecondaryKey',
        getSecondaryKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetSecondaryKeyRequest.fromBuffer(value),
        ($1.GetSecondaryKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetPublicKeyRequest, $1.GetPublicKeyResponse>(
        'GetPublicKey',
        getPublicKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetPublicKeyRequest.fromBuffer(value),
        ($1.GetPublicKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AcceptChatRequest, $1.AcceptChatResponse>(
        'AcceptChat',
        acceptChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AcceptChatRequest.fromBuffer(value),
        ($1.AcceptChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DisallowChatRequest, $1.DisallowChatResponse>(
        'DisallowChat',
        disallowChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DisallowChatRequest.fromBuffer(value),
        ($1.DisallowChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetMessagesRequest, $1.GetMessagesResponse>(
        'GetMessages',
        getMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetMessagesRequest.fromBuffer(value),
        ($1.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.StreamGetMessagesGeneralResponse>(
        'StreamGetMessagesGeneral',
        streamGetMessagesGeneral_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.StreamGetMessagesGeneralResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StreamGetMessagesRequest, $1.StreamGetMessagesResponse>(
        'StreamGetMessages',
        streamGetMessages,
        true,
        true,
        ($core.List<$core.int> value) => $1.StreamGetMessagesRequest.fromBuffer(value),
        ($1.StreamGetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.GetUnSuccessChatsResponse>(
        'GetUnSuccessChats',
        getUnSuccessChats_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.GetUnSuccessChatsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateResponseChat> createChat_Pre($grpc.ServiceCall call, $async.Future<$1.CreateRequestChat> request) async {
    return createChat(call, await request);
  }

  $async.Stream<$1.StreamGetResponseChat> streamGetChat_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* streamGetChat(call, await request);
  }

  $async.Future<$1.CreateSecondaryKeyResponse> createSecondaryKey_Pre($grpc.ServiceCall call, $async.Future<$1.CreateSecondaryKeyRequest> request) async {
    return createSecondaryKey(call, await request);
  }

  $async.Future<$1.GetSecondaryKeyResponse> getSecondaryKey_Pre($grpc.ServiceCall call, $async.Future<$1.GetSecondaryKeyRequest> request) async {
    return getSecondaryKey(call, await request);
  }

  $async.Future<$1.GetPublicKeyResponse> getPublicKey_Pre($grpc.ServiceCall call, $async.Future<$1.GetPublicKeyRequest> request) async {
    return getPublicKey(call, await request);
  }

  $async.Future<$1.AcceptChatResponse> acceptChat_Pre($grpc.ServiceCall call, $async.Future<$1.AcceptChatRequest> request) async {
    return acceptChat(call, await request);
  }

  $async.Future<$1.DisallowChatResponse> disallowChat_Pre($grpc.ServiceCall call, $async.Future<$1.DisallowChatRequest> request) async {
    return disallowChat(call, await request);
  }

  $async.Future<$1.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call, $async.Future<$1.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Stream<$1.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* streamGetMessagesGeneral(call, await request);
  }

  $async.Future<$1.GetUnSuccessChatsResponse> getUnSuccessChats_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getUnSuccessChats(call, await request);
  }

  $async.Future<$1.CreateResponseChat> createChat($grpc.ServiceCall call, $1.CreateRequestChat request);
  $async.Stream<$1.StreamGetResponseChat> streamGetChat($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.CreateSecondaryKeyResponse> createSecondaryKey($grpc.ServiceCall call, $1.CreateSecondaryKeyRequest request);
  $async.Future<$1.GetSecondaryKeyResponse> getSecondaryKey($grpc.ServiceCall call, $1.GetSecondaryKeyRequest request);
  $async.Future<$1.GetPublicKeyResponse> getPublicKey($grpc.ServiceCall call, $1.GetPublicKeyRequest request);
  $async.Future<$1.AcceptChatResponse> acceptChat($grpc.ServiceCall call, $1.AcceptChatRequest request);
  $async.Future<$1.DisallowChatResponse> disallowChat($grpc.ServiceCall call, $1.DisallowChatRequest request);
  $async.Future<$1.GetMessagesResponse> getMessages($grpc.ServiceCall call, $1.GetMessagesRequest request);
  $async.Stream<$1.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral($grpc.ServiceCall call, $1.Empty request);
  $async.Stream<$1.StreamGetMessagesResponse> streamGetMessages($grpc.ServiceCall call, $async.Stream<$1.StreamGetMessagesRequest> request);
  $async.Future<$1.GetUnSuccessChatsResponse> getUnSuccessChats($grpc.ServiceCall call, $1.Empty request);
}
