//
//  Generated code. Do not modify.
//  source: file/file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;
import '../user/user.pb.dart' as $0;

class DeleteFileRequest extends $pb.GeneratedMessage {
  factory DeleteFileRequest({
    $core.int? fileId,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    return $result;
  }
  DeleteFileRequest._() : super();
  factory DeleteFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.OU3, protoName: 'fileId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFileRequest clone() => DeleteFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFileRequest copyWith(void Function(DeleteFileRequest) updates) => super.copyWith((message) => updates(message as DeleteFileRequest)) as DeleteFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFileRequest create() => DeleteFileRequest._();
  DeleteFileRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteFileRequest> createRepeated() => $pb.PbList<DeleteFileRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFileRequest>(create);
  static DeleteFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);
}

class DeleteFileResponse extends $pb.GeneratedMessage {
  factory DeleteFileResponse() => create();
  DeleteFileResponse._() : super();
  factory DeleteFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFileResponse clone() => DeleteFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFileResponse copyWith(void Function(DeleteFileResponse) updates) => super.copyWith((message) => updates(message as DeleteFileResponse)) as DeleteFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFileResponse create() => DeleteFileResponse._();
  DeleteFileResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteFileResponse> createRepeated() => $pb.PbList<DeleteFileResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFileResponse>(create);
  static DeleteFileResponse? _defaultInstance;
}

class FileUploadRequest extends $pb.GeneratedMessage {
  factory FileUploadRequest({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.int? folderId,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  FileUploadRequest._() : super();
  factory FileUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadRequest clone() => FileUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadRequest copyWith(void Function(FileUploadRequest) updates) => super.copyWith((message) => updates(message as FileUploadRequest)) as FileUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadRequest create() => FileUploadRequest._();
  FileUploadRequest createEmptyInstance() => create();
  static $pb.PbList<FileUploadRequest> createRepeated() => $pb.PbList<FileUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadRequest>(create);
  static FileUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get folderId => $_getIZ(2);
  @$pb.TagNumber(3)
  set folderId($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolderId() => clearField(3);
}

class FileUploadResponse extends $pb.GeneratedMessage {
  factory FileUploadResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  FileUploadResponse._() : super();
  factory FileUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadResponse clone() => FileUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadResponse copyWith(void Function(FileUploadResponse) updates) => super.copyWith((message) => updates(message as FileUploadResponse)) as FileUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileUploadResponse create() => FileUploadResponse._();
  FileUploadResponse createEmptyInstance() => create();
  static $pb.PbList<FileUploadResponse> createRepeated() => $pb.PbList<FileUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadResponse>(create);
  static FileUploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class FileDownloadRequest extends $pb.GeneratedMessage {
  factory FileDownloadRequest({
    $core.int? fileId,
    $core.int? folderId,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  FileDownloadRequest._() : super();
  factory FileDownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDownloadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.OU3, protoName: 'fileId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadRequest clone() => FileDownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadRequest copyWith(void Function(FileDownloadRequest) updates) => super.copyWith((message) => updates(message as FileDownloadRequest)) as FileDownloadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest create() => FileDownloadRequest._();
  FileDownloadRequest createEmptyInstance() => create();
  static $pb.PbList<FileDownloadRequest> createRepeated() => $pb.PbList<FileDownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadRequest>(create);
  static FileDownloadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);
}

class FileDownloadResponse extends $pb.GeneratedMessage {
  factory FileDownloadResponse({
    $core.List<$core.int>? chunk,
    $core.String? fileName,
    $core.double? progress,
  }) {
    final $result = create();
    if (chunk != null) {
      $result.chunk = chunk;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    return $result;
  }
  FileDownloadResponse._() : super();
  factory FileDownloadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDownloadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDownloadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chunk', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'fileName', protoName: 'fileName')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDownloadResponse clone() => FileDownloadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDownloadResponse copyWith(void Function(FileDownloadResponse) updates) => super.copyWith((message) => updates(message as FileDownloadResponse)) as FileDownloadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse create() => FileDownloadResponse._();
  FileDownloadResponse createEmptyInstance() => create();
  static $pb.PbList<FileDownloadResponse> createRepeated() => $pb.PbList<FileDownloadResponse>();
  @$core.pragma('dart2js:noInline')
  static FileDownloadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDownloadResponse>(create);
  static FileDownloadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get progress => $_getN(2);
  @$pb.TagNumber(3)
  set progress($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearProgress() => clearField(3);
}

class FindFileRequest extends $pb.GeneratedMessage {
  factory FindFileRequest({
    $core.String? search,
    $core.int? folderId,
    $core.bool? findEveryWhere,
    $core.int? page,
  }) {
    final $result = create();
    if (search != null) {
      $result.search = search;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (findEveryWhere != null) {
      $result.findEveryWhere = findEveryWhere;
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  FindFileRequest._() : super();
  factory FindFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3, protoName: 'folderId')
    ..aOB(3, _omitFieldNames ? '' : 'findEveryWhere', protoName: 'findEveryWhere')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'page', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindFileRequest clone() => FindFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindFileRequest copyWith(void Function(FindFileRequest) updates) => super.copyWith((message) => updates(message as FindFileRequest)) as FindFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindFileRequest create() => FindFileRequest._();
  FindFileRequest createEmptyInstance() => create();
  static $pb.PbList<FindFileRequest> createRepeated() => $pb.PbList<FindFileRequest>();
  @$core.pragma('dart2js:noInline')
  static FindFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindFileRequest>(create);
  static FindFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get findEveryWhere => $_getBF(2);
  @$pb.TagNumber(3)
  set findEveryWhere($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFindEveryWhere() => $_has(2);
  @$pb.TagNumber(3)
  void clearFindEveryWhere() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);
}

class FindFileResponse extends $pb.GeneratedMessage {
  factory FindFileResponse({
    $core.Iterable<File>? files,
    $core.Iterable<Folder>? folders,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    if (folders != null) {
      $result.folders.addAll(folders);
    }
    return $result;
  }
  FindFileResponse._() : super();
  factory FindFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..pc<File>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: File.create)
    ..pc<Folder>(2, _omitFieldNames ? '' : 'folders', $pb.PbFieldType.PM, subBuilder: Folder.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindFileResponse clone() => FindFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindFileResponse copyWith(void Function(FindFileResponse) updates) => super.copyWith((message) => updates(message as FindFileResponse)) as FindFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindFileResponse create() => FindFileResponse._();
  FindFileResponse createEmptyInstance() => create();
  static $pb.PbList<FindFileResponse> createRepeated() => $pb.PbList<FindFileResponse>();
  @$core.pragma('dart2js:noInline')
  static FindFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindFileResponse>(create);
  static FindFileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<File> get files => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Folder> get folders => $_getList(1);
}

class Folder extends $pb.GeneratedMessage {
  factory Folder({
    $core.int? id,
    $2.Timestamp? createdAt,
    $2.Timestamp? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    $core.String? nameFolder,
    $core.Iterable<File>? files,
    Folder? folder,
    $0.User? user,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (nameFolder != null) {
      $result.nameFolder = nameFolder;
    }
    if (files != null) {
      $result.files.addAll(files);
    }
    if (folder != null) {
      $result.folder = folder;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  Folder._() : super();
  factory Folder.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Folder.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Folder', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'updatedAt', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'nameFolder')
    ..pc<File>(7, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: File.create)
    ..aOM<Folder>(8, _omitFieldNames ? '' : 'folder', subBuilder: Folder.create)
    ..aOM<$0.User>(9, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Folder clone() => Folder()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Folder copyWith(void Function(Folder) updates) => super.copyWith((message) => updates(message as Folder)) as Folder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Folder create() => Folder._();
  Folder createEmptyInstance() => create();
  static $pb.PbList<Folder> createRepeated() => $pb.PbList<Folder>();
  @$core.pragma('dart2js:noInline')
  static Folder getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Folder>(create);
  static Folder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get updatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set updatedAt($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureUpdatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get nameFolder => $_getSZ(5);
  @$pb.TagNumber(6)
  set nameFolder($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNameFolder() => $_has(5);
  @$pb.TagNumber(6)
  void clearNameFolder() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<File> get files => $_getList(6);

  @$pb.TagNumber(8)
  Folder get folder => $_getN(7);
  @$pb.TagNumber(8)
  set folder(Folder v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasFolder() => $_has(7);
  @$pb.TagNumber(8)
  void clearFolder() => clearField(8);
  @$pb.TagNumber(8)
  Folder ensureFolder() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.User get user => $_getN(8);
  @$pb.TagNumber(9)
  set user($0.User v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUser() => $_has(8);
  @$pb.TagNumber(9)
  void clearUser() => clearField(9);
  @$pb.TagNumber(9)
  $0.User ensureUser() => $_ensure(8);
}

class File extends $pb.GeneratedMessage {
  factory File({
    $core.int? id,
    $2.Timestamp? createdAt,
    $2.Timestamp? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    Media? media,
    Folder? folder,
    $0.User? user,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (media != null) {
      $result.media = media;
    }
    if (folder != null) {
      $result.folder = folder;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'File', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'updatedAt', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.OU3)
    ..aOM<Media>(6, _omitFieldNames ? '' : 'media', subBuilder: Media.create)
    ..aOM<Folder>(7, _omitFieldNames ? '' : 'folder', subBuilder: Folder.create)
    ..aOM<$0.User>(8, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get updatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set updatedAt($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureUpdatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  Media get media => $_getN(5);
  @$pb.TagNumber(6)
  set media(Media v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMedia() => $_has(5);
  @$pb.TagNumber(6)
  void clearMedia() => clearField(6);
  @$pb.TagNumber(6)
  Media ensureMedia() => $_ensure(5);

  @$pb.TagNumber(7)
  Folder get folder => $_getN(6);
  @$pb.TagNumber(7)
  set folder(Folder v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasFolder() => $_has(6);
  @$pb.TagNumber(7)
  void clearFolder() => clearField(7);
  @$pb.TagNumber(7)
  Folder ensureFolder() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.User get user => $_getN(7);
  @$pb.TagNumber(8)
  set user($0.User v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearUser() => clearField(8);
  @$pb.TagNumber(8)
  $0.User ensureUser() => $_ensure(7);
}

class Media extends $pb.GeneratedMessage {
  factory Media({
    $core.String? uuid,
    $core.String? name,
    $core.String? collectionName,
    $core.String? mimeType,
    $fixnum.Int64? size,
    $core.String? fileName,
    $core.String? extension_7,
    $core.String? customProperties,
    $core.String? modelType,
    $core.int? modelId,
  }) {
    final $result = create();
    if (uuid != null) {
      $result.uuid = uuid;
    }
    if (name != null) {
      $result.name = name;
    }
    if (collectionName != null) {
      $result.collectionName = collectionName;
    }
    if (mimeType != null) {
      $result.mimeType = mimeType;
    }
    if (size != null) {
      $result.size = size;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (extension_7 != null) {
      $result.extension_7 = extension_7;
    }
    if (customProperties != null) {
      $result.customProperties = customProperties;
    }
    if (modelType != null) {
      $result.modelType = modelType;
    }
    if (modelId != null) {
      $result.modelId = modelId;
    }
    return $result;
  }
  Media._() : super();
  factory Media.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Media.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Media', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uuid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'collectionName')
    ..aOS(4, _omitFieldNames ? '' : 'mimeType')
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'fileName')
    ..aOS(7, _omitFieldNames ? '' : 'extension')
    ..aOS(8, _omitFieldNames ? '' : 'customProperties')
    ..aOS(9, _omitFieldNames ? '' : 'modelType')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'modelId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Media clone() => Media()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Media copyWith(void Function(Media) updates) => super.copyWith((message) => updates(message as Media)) as Media;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Media create() => Media._();
  Media createEmptyInstance() => create();
  static $pb.PbList<Media> createRepeated() => $pb.PbList<Media>();
  @$core.pragma('dart2js:noInline')
  static Media getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Media>(create);
  static Media? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get collectionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set collectionName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCollectionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCollectionName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mimeType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mimeType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMimeType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMimeType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get size => $_getI64(4);
  @$pb.TagNumber(5)
  set size($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fileName => $_getSZ(5);
  @$pb.TagNumber(6)
  set fileName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFileName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFileName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get extension_7 => $_getSZ(6);
  @$pb.TagNumber(7)
  set extension_7($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExtension_7() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtension_7() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get customProperties => $_getSZ(7);
  @$pb.TagNumber(8)
  set customProperties($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCustomProperties() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustomProperties() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get modelType => $_getSZ(8);
  @$pb.TagNumber(9)
  set modelType($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasModelType() => $_has(8);
  @$pb.TagNumber(9)
  void clearModelType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get modelId => $_getIZ(9);
  @$pb.TagNumber(10)
  set modelId($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasModelId() => $_has(9);
  @$pb.TagNumber(10)
  void clearModelId() => clearField(10);
}

class RenameFileRequest extends $pb.GeneratedMessage {
  factory RenameFileRequest({
    $core.int? folderId,
    $core.int? fileId,
    $core.String? name,
  }) {
    final $result = create();
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RenameFileRequest._() : super();
  factory RenameFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RenameFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3, protoName: 'folderId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3, protoName: 'fileId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenameFileRequest clone() => RenameFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenameFileRequest copyWith(void Function(RenameFileRequest) updates) => super.copyWith((message) => updates(message as RenameFileRequest)) as RenameFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFileRequest create() => RenameFileRequest._();
  RenameFileRequest createEmptyInstance() => create();
  static $pb.PbList<RenameFileRequest> createRepeated() => $pb.PbList<RenameFileRequest>();
  @$core.pragma('dart2js:noInline')
  static RenameFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameFileRequest>(create);
  static RenameFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folderId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folderId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get fileId => $_getIZ(1);
  @$pb.TagNumber(2)
  set fileId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class RenameFileResponse extends $pb.GeneratedMessage {
  factory RenameFileResponse() => create();
  RenameFileResponse._() : super();
  factory RenameFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RenameFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenameFileResponse clone() => RenameFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenameFileResponse copyWith(void Function(RenameFileResponse) updates) => super.copyWith((message) => updates(message as RenameFileResponse)) as RenameFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFileResponse create() => RenameFileResponse._();
  RenameFileResponse createEmptyInstance() => create();
  static $pb.PbList<RenameFileResponse> createRepeated() => $pb.PbList<RenameFileResponse>();
  @$core.pragma('dart2js:noInline')
  static RenameFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameFileResponse>(create);
  static RenameFileResponse? _defaultInstance;
}

class MoveFileRequest extends $pb.GeneratedMessage {
  factory MoveFileRequest({
    $core.int? fileId,
    $core.int? folderToId,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (folderToId != null) {
      $result.folderToId = folderToId;
    }
    return $result;
  }
  MoveFileRequest._() : super();
  factory MoveFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3, protoName: 'fileId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderToId', $pb.PbFieldType.O3, protoName: 'folderToId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveFileRequest clone() => MoveFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveFileRequest copyWith(void Function(MoveFileRequest) updates) => super.copyWith((message) => updates(message as MoveFileRequest)) as MoveFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFileRequest create() => MoveFileRequest._();
  MoveFileRequest createEmptyInstance() => create();
  static $pb.PbList<MoveFileRequest> createRepeated() => $pb.PbList<MoveFileRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFileRequest>(create);
  static MoveFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fileId => $_getIZ(0);
  @$pb.TagNumber(1)
  set fileId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderToId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderToId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderToId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderToId() => clearField(2);
}

class MoveFileResponse extends $pb.GeneratedMessage {
  factory MoveFileResponse() => create();
  MoveFileResponse._() : super();
  factory MoveFileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveFileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveFileResponse clone() => MoveFileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveFileResponse copyWith(void Function(MoveFileResponse) updates) => super.copyWith((message) => updates(message as MoveFileResponse)) as MoveFileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFileResponse create() => MoveFileResponse._();
  MoveFileResponse createEmptyInstance() => create();
  static $pb.PbList<MoveFileResponse> createRepeated() => $pb.PbList<MoveFileResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveFileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFileResponse>(create);
  static MoveFileResponse? _defaultInstance;
}

class GetSpaceRequest extends $pb.GeneratedMessage {
  factory GetSpaceRequest() => create();
  GetSpaceRequest._() : super();
  factory GetSpaceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSpaceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSpaceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSpaceRequest clone() => GetSpaceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSpaceRequest copyWith(void Function(GetSpaceRequest) updates) => super.copyWith((message) => updates(message as GetSpaceRequest)) as GetSpaceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSpaceRequest create() => GetSpaceRequest._();
  GetSpaceRequest createEmptyInstance() => create();
  static $pb.PbList<GetSpaceRequest> createRepeated() => $pb.PbList<GetSpaceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSpaceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSpaceRequest>(create);
  static GetSpaceRequest? _defaultInstance;
}

class GetSpaceResponse extends $pb.GeneratedMessage {
  factory GetSpaceResponse({
    $core.int? space,
  }) {
    final $result = create();
    if (space != null) {
      $result.space = space;
    }
    return $result;
  }
  GetSpaceResponse._() : super();
  factory GetSpaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSpaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSpaceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'file'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'space', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSpaceResponse clone() => GetSpaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSpaceResponse copyWith(void Function(GetSpaceResponse) updates) => super.copyWith((message) => updates(message as GetSpaceResponse)) as GetSpaceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSpaceResponse create() => GetSpaceResponse._();
  GetSpaceResponse createEmptyInstance() => create();
  static $pb.PbList<GetSpaceResponse> createRepeated() => $pb.PbList<GetSpaceResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSpaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSpaceResponse>(create);
  static GetSpaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get space => $_getIZ(0);
  @$pb.TagNumber(1)
  set space($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSpace() => $_has(0);
  @$pb.TagNumber(1)
  void clearSpace() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
