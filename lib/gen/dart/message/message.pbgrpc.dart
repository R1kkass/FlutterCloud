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

import 'message.pb.dart' as $2;

export 'message.pb.dart';

@$pb.GrpcServiceName('message.MessageGreeter')
class MessageGreeterClient extends $grpc.Client {
  static final _$uploadMessageFile = $grpc.ClientMethod<$2.UploadFileMessageRequest, $2.UploadFileMessageResponse>(
      '/message.MessageGreeter/UploadMessageFile',
      ($2.UploadFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UploadFileMessageResponse.fromBuffer(value));
  static final _$downloadMessageFile = $grpc.ClientMethod<$2.DownloadFileMessageRequest, $2.DownloadFileMessageResponse>(
      '/message.MessageGreeter/DownloadMessageFile',
      ($2.DownloadFileMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DownloadFileMessageResponse.fromBuffer(value));

  MessageGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.UploadFileMessageResponse> uploadMessageFile($async.Stream<$2.UploadFileMessageRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadMessageFile, request, options: options).single;
  }

  $grpc.ResponseStream<$2.DownloadFileMessageResponse> downloadMessageFile($2.DownloadFileMessageRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadMessageFile, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('message.MessageGreeter')
abstract class MessageGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'message.MessageGreeter';

  MessageGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UploadFileMessageRequest, $2.UploadFileMessageResponse>(
        'UploadMessageFile',
        uploadMessageFile,
        true,
        false,
        ($core.List<$core.int> value) => $2.UploadFileMessageRequest.fromBuffer(value),
        ($2.UploadFileMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DownloadFileMessageRequest, $2.DownloadFileMessageResponse>(
        'DownloadMessageFile',
        downloadMessageFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.DownloadFileMessageRequest.fromBuffer(value),
        ($2.DownloadFileMessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$2.DownloadFileMessageResponse> downloadMessageFile_Pre($grpc.ServiceCall call, $async.Future<$2.DownloadFileMessageRequest> request) async* {
    yield* downloadMessageFile(call, await request);
  }

  $async.Future<$2.UploadFileMessageResponse> uploadMessageFile($grpc.ServiceCall call, $async.Stream<$2.UploadFileMessageRequest> request);
  $async.Stream<$2.DownloadFileMessageResponse> downloadMessageFile($grpc.ServiceCall call, $2.DownloadFileMessageRequest request);
}
