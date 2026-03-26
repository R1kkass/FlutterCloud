//
//  Generated code. Do not modify.
//  source: file/file.proto
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

import 'file.pb.dart' as $1;

export 'file.pb.dart';

@$pb.GrpcServiceName('file.FilesGreeter')
class FilesGreeterClient extends $grpc.Client {
  static final _$uploadFile = $grpc.ClientMethod<$1.FileUploadRequest, $1.FileUploadResponse>(
      '/file.FilesGreeter/UploadFile',
      ($1.FileUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FileUploadResponse.fromBuffer(value));
  static final _$downloadFile = $grpc.ClientMethod<$1.FileDownloadRequest, $1.FileDownloadResponse>(
      '/file.FilesGreeter/DownloadFile',
      ($1.FileDownloadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FileDownloadResponse.fromBuffer(value));
  static final _$findFile = $grpc.ClientMethod<$1.FindFileRequest, $1.FindFileResponse>(
      '/file.FilesGreeter/FindFile',
      ($1.FindFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FindFileResponse.fromBuffer(value));
  static final _$deleteFile = $grpc.ClientMethod<$1.DeleteFileRequest, $1.DeleteFileResponse>(
      '/file.FilesGreeter/DeleteFile',
      ($1.DeleteFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DeleteFileResponse.fromBuffer(value));
  static final _$renameFile = $grpc.ClientMethod<$1.RenameFileRequest, $1.RenameFileResponse>(
      '/file.FilesGreeter/RenameFile',
      ($1.RenameFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RenameFileResponse.fromBuffer(value));
  static final _$moveFile = $grpc.ClientMethod<$1.MoveFileRequest, $1.MoveFileResponse>(
      '/file.FilesGreeter/MoveFile',
      ($1.MoveFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.MoveFileResponse.fromBuffer(value));
  static final _$getSpace = $grpc.ClientMethod<$1.GetSpaceRequest, $1.GetSpaceResponse>(
      '/file.FilesGreeter/GetSpace',
      ($1.GetSpaceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetSpaceResponse.fromBuffer(value));

  FilesGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.FileUploadResponse> uploadFile($async.Stream<$1.FileUploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadFile, request, options: options).single;
  }

  $grpc.ResponseStream<$1.FileDownloadResponse> downloadFile($1.FileDownloadRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$downloadFile, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$1.FindFileResponse> findFile($1.FindFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteFileResponse> deleteFile($1.DeleteFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.RenameFileResponse> renameFile($1.RenameFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.MoveFileResponse> moveFile($1.MoveFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$moveFile, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetSpaceResponse> getSpace($1.GetSpaceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSpace, request, options: options);
  }
}

@$pb.GrpcServiceName('file.FilesGreeter')
abstract class FilesGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'file.FilesGreeter';

  FilesGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FileUploadRequest, $1.FileUploadResponse>(
        'UploadFile',
        uploadFile,
        true,
        false,
        ($core.List<$core.int> value) => $1.FileUploadRequest.fromBuffer(value),
        ($1.FileUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FileDownloadRequest, $1.FileDownloadResponse>(
        'DownloadFile',
        downloadFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.FileDownloadRequest.fromBuffer(value),
        ($1.FileDownloadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FindFileRequest, $1.FindFileResponse>(
        'FindFile',
        findFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FindFileRequest.fromBuffer(value),
        ($1.FindFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteFileRequest, $1.DeleteFileResponse>(
        'DeleteFile',
        deleteFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteFileRequest.fromBuffer(value),
        ($1.DeleteFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RenameFileRequest, $1.RenameFileResponse>(
        'RenameFile',
        renameFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RenameFileRequest.fromBuffer(value),
        ($1.RenameFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MoveFileRequest, $1.MoveFileResponse>(
        'MoveFile',
        moveFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MoveFileRequest.fromBuffer(value),
        ($1.MoveFileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetSpaceRequest, $1.GetSpaceResponse>(
        'GetSpace',
        getSpace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetSpaceRequest.fromBuffer(value),
        ($1.GetSpaceResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$1.FileDownloadResponse> downloadFile_Pre($grpc.ServiceCall call, $async.Future<$1.FileDownloadRequest> request) async* {
    yield* downloadFile(call, await request);
  }

  $async.Future<$1.FindFileResponse> findFile_Pre($grpc.ServiceCall call, $async.Future<$1.FindFileRequest> request) async {
    return findFile(call, await request);
  }

  $async.Future<$1.DeleteFileResponse> deleteFile_Pre($grpc.ServiceCall call, $async.Future<$1.DeleteFileRequest> request) async {
    return deleteFile(call, await request);
  }

  $async.Future<$1.RenameFileResponse> renameFile_Pre($grpc.ServiceCall call, $async.Future<$1.RenameFileRequest> request) async {
    return renameFile(call, await request);
  }

  $async.Future<$1.MoveFileResponse> moveFile_Pre($grpc.ServiceCall call, $async.Future<$1.MoveFileRequest> request) async {
    return moveFile(call, await request);
  }

  $async.Future<$1.GetSpaceResponse> getSpace_Pre($grpc.ServiceCall call, $async.Future<$1.GetSpaceRequest> request) async {
    return getSpace(call, await request);
  }

  $async.Future<$1.FileUploadResponse> uploadFile($grpc.ServiceCall call, $async.Stream<$1.FileUploadRequest> request);
  $async.Stream<$1.FileDownloadResponse> downloadFile($grpc.ServiceCall call, $1.FileDownloadRequest request);
  $async.Future<$1.FindFileResponse> findFile($grpc.ServiceCall call, $1.FindFileRequest request);
  $async.Future<$1.DeleteFileResponse> deleteFile($grpc.ServiceCall call, $1.DeleteFileRequest request);
  $async.Future<$1.RenameFileResponse> renameFile($grpc.ServiceCall call, $1.RenameFileRequest request);
  $async.Future<$1.MoveFileResponse> moveFile($grpc.ServiceCall call, $1.MoveFileRequest request);
  $async.Future<$1.GetSpaceResponse> getSpace($grpc.ServiceCall call, $1.GetSpaceRequest request);
}
