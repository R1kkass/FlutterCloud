//
//  Generated code. Do not modify.
//  source: message/message.proto
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

import 'message.pb.dart' as $0;

export 'message.pb.dart';

@$pb.GrpcServiceName('message.MessageGreeter')
class MessageGreeterClient extends $grpc.Client {
  static final _$uploadMessageFile = $grpc.ClientMethod<$0.UploadFileMessageRequest, $0.UploadFileMessageResponse>(
      '/message.MessageGreeter/UploadMessageFile',
      ($0.UploadFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadFileMessageResponse.fromBuffer(value));
  static final _$downloadMessageFile = $grpc.ClientMethod<$0.DownloadFileMessageRequest, $0.DownloadFileMessageResponse>(
      '/message.MessageGreeter/DownloadMessageFile',
      ($0.DownloadFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DownloadFileMessageResponse.fromBuffer(value));
  static final _$createFileMessage = $grpc.ClientMethod<$0.CreateFileMessageRequest, $0.CreateFileMessageResponse>(
      '/message.MessageGreeter/CreateFileMessage',
      ($0.CreateFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateFileMessageResponse.fromBuffer(value));

  MessageGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.UploadFileMessageResponse> uploadMessageFile($async.Stream<$0.UploadFileMessageRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadMessageFile, request, options: options).single;
  }

  $grpc.ResponseStream<$0.DownloadFileMessageResponse> downloadMessageFile($0.DownloadFileMessageRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadMessageFile, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.CreateFileMessageResponse> createFileMessage($0.CreateFileMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFileMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('message.MessageGreeter')
abstract class MessageGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'message.MessageGreeter';

  MessageGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UploadFileMessageRequest, $0.UploadFileMessageResponse>(
        'UploadMessageFile',
        uploadMessageFile,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadFileMessageRequest.fromBuffer(value),
        ($0.UploadFileMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DownloadFileMessageRequest, $0.DownloadFileMessageResponse>(
        'DownloadMessageFile',
        downloadMessageFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadFileMessageRequest.fromBuffer(value),
        ($0.DownloadFileMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateFileMessageRequest, $0.CreateFileMessageResponse>(
        'CreateFileMessage',
        createFileMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateFileMessageRequest.fromBuffer(value),
        ($0.CreateFileMessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.DownloadFileMessageResponse> downloadMessageFile_Pre($grpc.ServiceCall call, $async.Future<$0.DownloadFileMessageRequest> request) async* {
    yield* downloadMessageFile(call, await request);
  }

  $async.Future<$0.CreateFileMessageResponse> createFileMessage_Pre($grpc.ServiceCall call, $async.Future<$0.CreateFileMessageRequest> request) async {
    return createFileMessage(call, await request);
  }

  $async.Future<$0.UploadFileMessageResponse> uploadMessageFile($grpc.ServiceCall call, $async.Stream<$0.UploadFileMessageRequest> request);
  $async.Stream<$0.DownloadFileMessageResponse> downloadMessageFile($grpc.ServiceCall call, $0.DownloadFileMessageRequest request);
  $async.Future<$0.CreateFileMessageResponse> createFileMessage($grpc.ServiceCall call, $0.CreateFileMessageRequest request);
}
