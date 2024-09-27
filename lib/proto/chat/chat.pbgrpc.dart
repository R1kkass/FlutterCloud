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
  static final _$getChat = $grpc.ClientMethod<$0.GetRequestChat, $0.GetResponseChat>(
      '/chat.ChatGreeter/GetChat',
      ($0.GetRequestChat value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetResponseChat.fromBuffer(value));
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

  ChatGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateResponseChat> createChat($0.CreateRequestChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetResponseChat> getChat($0.GetRequestChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChat, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.GetRequestChat, $0.GetResponseChat>(
        'GetChat',
        getChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRequestChat.fromBuffer(value),
        ($0.GetResponseChat value) => value.writeToBuffer()));
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
  }

  $async.Future<$0.CreateResponseChat> createChat_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRequestChat> request) async {
    return createChat(call, await request);
  }

  $async.Future<$0.GetResponseChat> getChat_Pre($grpc.ServiceCall call, $async.Future<$0.GetRequestChat> request) async {
    return getChat(call, await request);
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

  $async.Future<$0.CreateResponseChat> createChat($grpc.ServiceCall call, $0.CreateRequestChat request);
  $async.Future<$0.GetResponseChat> getChat($grpc.ServiceCall call, $0.GetRequestChat request);
  $async.Future<$0.CreateSecondaryKeyResponse> createSecondaryKey($grpc.ServiceCall call, $0.CreateSecondaryKeyRequest request);
  $async.Future<$0.GetSecondaryKeyResponse> getSecondaryKey($grpc.ServiceCall call, $0.GetSecondaryKeyRequest request);
  $async.Future<$0.GetPublicKeyResponse> getPublicKey($grpc.ServiceCall call, $0.GetPublicKeyRequest request);
  $async.Future<$0.AcceptChatResponse> acceptChat($grpc.ServiceCall call, $0.AcceptChatRequest request);
  $async.Future<$0.DissalowChatResponse> dissalowChat($grpc.ServiceCall call, $0.DissalowChatRequest request);
}
