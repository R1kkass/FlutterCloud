//
//  Generated code. Do not modify.
//  source: folder/folder.proto
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

import 'folder.pb.dart' as $0;

export 'folder.pb.dart';

@$pb.GrpcServiceName('folder.FolderGreeter')
class FolderGreeterClient extends $grpc.Client {
  static final _$createFolder = $grpc.ClientMethod<$0.CreateFolderRequest, $0.CreateFolderResponse>(
      '/folder.FolderGreeter/CreateFolder',
      ($0.CreateFolderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateFolderResponse.fromBuffer(value));
  static final _$deleteFolder = $grpc.ClientMethod<$0.DeleteFolderRequest, $0.DeleteFolderResponse>(
      '/folder.FolderGreeter/DeleteFolder',
      ($0.DeleteFolderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteFolderResponse.fromBuffer(value));
  static final _$renameFolder = $grpc.ClientMethod<$0.RenameFolderRequest, $0.RenameFolderResponse>(
      '/folder.FolderGreeter/RenameFolder',
      ($0.RenameFolderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RenameFolderResponse.fromBuffer(value));
  static final _$moveFolder = $grpc.ClientMethod<$0.MoveFolderRequest, $0.MoveFolderResponse>(
      '/folder.FolderGreeter/MoveFolder',
      ($0.MoveFolderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MoveFolderResponse.fromBuffer(value));

  FolderGreeterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateFolderResponse> createFolder($0.CreateFolderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFolder, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteFolderResponse> deleteFolder($0.DeleteFolderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFolder, request, options: options);
  }

  $grpc.ResponseFuture<$0.RenameFolderResponse> renameFolder($0.RenameFolderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$renameFolder, request, options: options);
  }

  $grpc.ResponseFuture<$0.MoveFolderResponse> moveFolder($0.MoveFolderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$moveFolder, request, options: options);
  }
}

@$pb.GrpcServiceName('folder.FolderGreeter')
abstract class FolderGreeterServiceBase extends $grpc.Service {
  $core.String get $name => 'folder.FolderGreeter';

  FolderGreeterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateFolderRequest, $0.CreateFolderResponse>(
        'CreateFolder',
        createFolder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateFolderRequest.fromBuffer(value),
        ($0.CreateFolderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteFolderRequest, $0.DeleteFolderResponse>(
        'DeleteFolder',
        deleteFolder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteFolderRequest.fromBuffer(value),
        ($0.DeleteFolderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameFolderRequest, $0.RenameFolderResponse>(
        'RenameFolder',
        renameFolder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RenameFolderRequest.fromBuffer(value),
        ($0.RenameFolderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MoveFolderRequest, $0.MoveFolderResponse>(
        'MoveFolder',
        moveFolder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MoveFolderRequest.fromBuffer(value),
        ($0.MoveFolderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateFolderResponse> createFolder_Pre($grpc.ServiceCall call, $async.Future<$0.CreateFolderRequest> request) async {
    return createFolder(call, await request);
  }

  $async.Future<$0.DeleteFolderResponse> deleteFolder_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteFolderRequest> request) async {
    return deleteFolder(call, await request);
  }

  $async.Future<$0.RenameFolderResponse> renameFolder_Pre($grpc.ServiceCall call, $async.Future<$0.RenameFolderRequest> request) async {
    return renameFolder(call, await request);
  }

  $async.Future<$0.MoveFolderResponse> moveFolder_Pre($grpc.ServiceCall call, $async.Future<$0.MoveFolderRequest> request) async {
    return moveFolder(call, await request);
  }

  $async.Future<$0.CreateFolderResponse> createFolder($grpc.ServiceCall call, $0.CreateFolderRequest request);
  $async.Future<$0.DeleteFolderResponse> deleteFolder($grpc.ServiceCall call, $0.DeleteFolderRequest request);
  $async.Future<$0.RenameFolderResponse> renameFolder($grpc.ServiceCall call, $0.RenameFolderRequest request);
  $async.Future<$0.MoveFolderResponse> moveFolder($grpc.ServiceCall call, $0.MoveFolderRequest request);
}
