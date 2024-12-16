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

import 'chat.pb.dart' as $0;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatGreeter')
class ChatGreeterClient extends $grpc.Client {
  static final _$createChat = $grpc.ClientMethod<$0.CreateRequestChat, $0.CreateResponseChat>(
      '/chat.ChatGreeter/CreateChat',
      ($0.CreateRequestChat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateResponseChat.fromBuffer(value));
  static final _$streamGetChat = $grpc.ClientMethod<$0.Empty, $0.StreamGetResponseChat>(
      '/chat.ChatGreeter/StreamGetChat',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamGetResponseChat.fromBuffer(value));
  static final _$createSecondaryKey = $grpc.ClientMethod<$0.CreateSecondaryKeyRequest, $0.CreateSecondaryKeyResponse>(
      '/chat.ChatGreeter/CreateSecondaryKey',
      ($0.CreateSecondaryKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateSecondaryKeyResponse.fromBuffer(value));
  static final _$getSecondaryKey = $grpc.ClientMethod<$0.GetSecondaryKeyRequest, $0.GetSecondaryKeyResponse>(
      '/chat.ChatGreeter/GetSecondaryKey',
      ($0.GetSecondaryKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSecondaryKeyResponse.fromBuffer(value));
  static final _$getPublicKey = $grpc.ClientMethod<$0.GetPublicKeyRequest, $0.GetPublicKeyResponse>(
      '/chat.ChatGreeter/GetPublicKey',
      ($0.GetPublicKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPublicKeyResponse.fromBuffer(value));
  static final _$acceptChat = $grpc.ClientMethod<$0.AcceptChatRequest, $0.AcceptChatResponse>(
      '/chat.ChatGreeter/AcceptChat',
      ($0.AcceptChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AcceptChatResponse.fromBuffer(value));
  static final _$dissalowChat = $grpc.ClientMethod<$0.DissalowChatRequest, $0.DissalowChatResponse>(
      '/chat.ChatGreeter/DissalowChat',
      ($0.DissalowChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DissalowChatResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
      '/chat.ChatGreeter/GetMessages',
      ($0.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetMessagesResponse.fromBuffer(value));
  static final _$streamGetMessagesGeneral = $grpc.ClientMethod<$0.Empty, $0.StreamGetMessagesGeneralResponse>(
      '/chat.ChatGreeter/StreamGetMessagesGeneral',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamGetMessagesGeneralResponse.fromBuffer(value));
  static final _$streamGetMessages = $grpc.ClientMethod<$0.StreamGetMessagesRequest, $0.StreamGetMessagesResponse>(
      '/chat.ChatGreeter/StreamGetMessages',
      ($0.StreamGetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StreamGetMessagesResponse.fromBuffer(value));
  static final _$getUnSuccessChats = $grpc.ClientMethod<$0.Empty, $0.GetUnSuccessChatsResponse>(
      '/chat.ChatGreeter/GetUnSuccessChats',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUnSuccessChatsResponse.fromBuffer(value));
  static final _$uploadChatFile = $grpc.ClientMethod<$0.UploadFileChatRequest, $0.UploadFileChatResponse>(
      '/chat.ChatGreeter/UploadChatFile',
      ($0.UploadFileChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadFileChatResponse.fromBuffer(value));
  static final _$downloadChatFile = $grpc.ClientMethod<$0.DownloadFileChatRequest, $0.DownloadFileChatResponse>(
      '/chat.ChatGreeter/DownloadChatFile',
      ($0.DownloadFileChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloadFileChatResponse.fromBuffer(value));
  static final _$createFileMessage = $grpc.ClientMethod<$0.CreateFileMessageRequest, $0.CreateFileMessageResponse>(
      '/chat.ChatGreeter/CreateFileMessage',
      ($0.CreateFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateFileMessageResponse.fromBuffer(value));

  ChatGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateResponseChat> createChat($0.CreateRequestChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChat, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamGetResponseChat> streamGetChat($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetChat, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.CreateSecondaryKeyResponse> createSecondaryKey($0.CreateSecondaryKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSecondaryKey, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSecondaryKeyResponse> getSecondaryKey($0.GetSecondaryKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSecondaryKey, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPublicKeyResponse> getPublicKey($0.GetPublicKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPublicKey, request, options: options);
  }

  $grpc.ResponseFuture<$0.AcceptChatResponse> acceptChat($0.AcceptChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acceptChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.DissalowChatResponse> dissalowChat($0.DissalowChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dissalowChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessagesResponse> getMessages($0.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseStream<$0.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral($0.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetMessagesGeneral, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.StreamGetMessagesResponse> streamGetMessages($async.Stream<$0.StreamGetMessagesRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamGetMessages, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUnSuccessChatsResponse> getUnSuccessChats($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUnSuccessChats, request, options: options);
  }

  $grpc.ResponseFuture<$0.UploadFileChatResponse> uploadChatFile($async.Stream<$0.UploadFileChatRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadChatFile, request, options: options).single;
  }

  $grpc.ResponseStream<$0.DownloadFileChatResponse> downloadChatFile($0.DownloadFileChatRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadChatFile, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.CreateFileMessageResponse> createFileMessage($0.CreateFileMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFileMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatGreeter')
abstract class ChatGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatGreeter';

  ChatGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRequestChat, $0.CreateResponseChat>(
        'CreateChat',
        createChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRequestChat.fromBuffer(value),
        ($0.CreateResponseChat value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.StreamGetResponseChat>(
        'StreamGetChat',
        streamGetChat_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.StreamGetResponseChat value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSecondaryKeyRequest, $0.CreateSecondaryKeyResponse>(
        'CreateSecondaryKey',
        createSecondaryKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateSecondaryKeyRequest.fromBuffer(value),
        ($0.CreateSecondaryKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSecondaryKeyRequest, $0.GetSecondaryKeyResponse>(
        'GetSecondaryKey',
        getSecondaryKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSecondaryKeyRequest.fromBuffer(value),
        ($0.GetSecondaryKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPublicKeyRequest, $0.GetPublicKeyResponse>(
        'GetPublicKey',
        getPublicKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPublicKeyRequest.fromBuffer(value),
        ($0.GetPublicKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AcceptChatRequest, $0.AcceptChatResponse>(
        'AcceptChat',
        acceptChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AcceptChatRequest.fromBuffer(value),
        ($0.AcceptChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DissalowChatRequest, $0.DissalowChatResponse>(
        'DissalowChat',
        dissalowChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DissalowChatRequest.fromBuffer(value),
        ($0.DissalowChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
        'GetMessages',
        getMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetMessagesRequest.fromBuffer(value),
        ($0.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.StreamGetMessagesGeneralResponse>(
        'StreamGetMessagesGeneral',
        streamGetMessagesGeneral_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.StreamGetMessagesGeneralResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamGetMessagesRequest, $0.StreamGetMessagesResponse>(
        'StreamGetMessages',
        streamGetMessages,
        true,
        true,
        ($core.List<$core.int> value) => $0.StreamGetMessagesRequest.fromBuffer(value),
        ($0.StreamGetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetUnSuccessChatsResponse>(
        'GetUnSuccessChats',
        getUnSuccessChats_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetUnSuccessChatsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadFileChatRequest, $0.UploadFileChatResponse>(
        'UploadChatFile',
        uploadChatFile,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadFileChatRequest.fromBuffer(value),
        ($0.UploadFileChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadFileChatRequest, $0.DownloadFileChatResponse>(
        'DownloadChatFile',
        downloadChatFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadFileChatRequest.fromBuffer(value),
        ($0.DownloadFileChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateFileMessageRequest, $0.CreateFileMessageResponse>(
        'CreateFileMessage',
        createFileMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateFileMessageRequest.fromBuffer(value),
        ($0.CreateFileMessageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateResponseChat> createChat_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRequestChat> request) async {
    return createChat(call, await request);
  }

  $async.Stream<$0.StreamGetResponseChat> streamGetChat_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamGetChat(call, await request);
  }

  $async.Future<$0.CreateSecondaryKeyResponse> createSecondaryKey_Pre($grpc.ServiceCall call, $async.Future<$0.CreateSecondaryKeyRequest> request) async {
    return createSecondaryKey(call, await request);
  }

  $async.Future<$0.GetSecondaryKeyResponse> getSecondaryKey_Pre($grpc.ServiceCall call, $async.Future<$0.GetSecondaryKeyRequest> request) async {
    return getSecondaryKey(call, await request);
  }

  $async.Future<$0.GetPublicKeyResponse> getPublicKey_Pre($grpc.ServiceCall call, $async.Future<$0.GetPublicKeyRequest> request) async {
    return getPublicKey(call, await request);
  }

  $async.Future<$0.AcceptChatResponse> acceptChat_Pre($grpc.ServiceCall call, $async.Future<$0.AcceptChatRequest> request) async {
    return acceptChat(call, await request);
  }

  $async.Future<$0.DissalowChatResponse> dissalowChat_Pre($grpc.ServiceCall call, $async.Future<$0.DissalowChatRequest> request) async {
    return dissalowChat(call, await request);
  }

  $async.Future<$0.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call, $async.Future<$0.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Stream<$0.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamGetMessagesGeneral(call, await request);
  }

  $async.Future<$0.GetUnSuccessChatsResponse> getUnSuccessChats_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getUnSuccessChats(call, await request);
  }

  $async.Stream<$0.DownloadFileChatResponse> downloadChatFile_Pre($grpc.ServiceCall call, $async.Future<$0.DownloadFileChatRequest> request) async* {
    yield* downloadChatFile(call, await request);
  }

  $async.Future<$0.CreateFileMessageResponse> createFileMessage_Pre($grpc.ServiceCall call, $async.Future<$0.CreateFileMessageRequest> request) async {
    return createFileMessage(call, await request);
  }

  $async.Future<$0.CreateResponseChat> createChat($grpc.ServiceCall call, $0.CreateRequestChat request);
  $async.Stream<$0.StreamGetResponseChat> streamGetChat($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.CreateSecondaryKeyResponse> createSecondaryKey($grpc.ServiceCall call, $0.CreateSecondaryKeyRequest request);
  $async.Future<$0.GetSecondaryKeyResponse> getSecondaryKey($grpc.ServiceCall call, $0.GetSecondaryKeyRequest request);
  $async.Future<$0.GetPublicKeyResponse> getPublicKey($grpc.ServiceCall call, $0.GetPublicKeyRequest request);
  $async.Future<$0.AcceptChatResponse> acceptChat($grpc.ServiceCall call, $0.AcceptChatRequest request);
  $async.Future<$0.DissalowChatResponse> dissalowChat($grpc.ServiceCall call, $0.DissalowChatRequest request);
  $async.Future<$0.GetMessagesResponse> getMessages($grpc.ServiceCall call, $0.GetMessagesRequest request);
  $async.Stream<$0.StreamGetMessagesGeneralResponse> streamGetMessagesGeneral($grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.StreamGetMessagesResponse> streamGetMessages($grpc.ServiceCall call, $async.Stream<$0.StreamGetMessagesRequest> request);
  $async.Future<$0.GetUnSuccessChatsResponse> getUnSuccessChats($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.UploadFileChatResponse> uploadChatFile($grpc.ServiceCall call, $async.Stream<$0.UploadFileChatRequest> request);
  $async.Stream<$0.DownloadFileChatResponse> downloadChatFile($grpc.ServiceCall call, $0.DownloadFileChatRequest request);
  $async.Future<$0.CreateFileMessageResponse> createFileMessage($grpc.ServiceCall call, $0.CreateFileMessageRequest request);
}
