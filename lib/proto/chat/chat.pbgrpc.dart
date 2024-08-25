//
//  Generated code. Do not modify.
//  source: chat.proto
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
  static final _$getChat = $grpc.ClientMethod<$0.Empty, $0.GetResponseChat>(
      '/chat.ChatGreeter/GetChat',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetResponseChat.fromBuffer(value));

  ChatGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateResponseChat> createChat($0.CreateRequestChat request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChat, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetResponseChat> getChat($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChat, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetResponseChat>(
        'GetChat',
        getChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetResponseChat value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateResponseChat> createChat_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRequestChat> request) async {
    return createChat(call, await request);
  }

  $async.Future<$0.GetResponseChat> getChat_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getChat(call, await request);
  }

  $async.Future<$0.CreateResponseChat> createChat($grpc.ServiceCall call, $0.CreateRequestChat request);
  $async.Future<$0.GetResponseChat> getChat($grpc.ServiceCall call, $0.Empty request);
}
