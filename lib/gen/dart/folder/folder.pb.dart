//
//  Generated code. Do not modify.
//  source: folder/folder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateFolderRequest extends $pb.GeneratedMessage {
  factory CreateFolderRequest({
    $core.String? name,
    $core.int? folderId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  CreateFolderRequest._() : super();
  factory CreateFolderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFolderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFolderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3, protoName: 'folderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFolderRequest clone() => CreateFolderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFolderRequest copyWith(void Function(CreateFolderRequest) updates) => super.copyWith((message) => updates(message as CreateFolderRequest)) as CreateFolderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFolderRequest create() => CreateFolderRequest._();
  CreateFolderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFolderRequest> createRepeated() => $pb.PbList<CreateFolderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFolderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFolderRequest>(create);
  static CreateFolderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);
}

class CreateFolderResponse extends $pb.GeneratedMessage {
  factory CreateFolderResponse() => create();
  CreateFolderResponse._() : super();
  factory CreateFolderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFolderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFolderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFolderResponse clone() => CreateFolderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFolderResponse copyWith(void Function(CreateFolderResponse) updates) => super.copyWith((message) => updates(message as CreateFolderResponse)) as CreateFolderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFolderResponse create() => CreateFolderResponse._();
  CreateFolderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFolderResponse> createRepeated() => $pb.PbList<CreateFolderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFolderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFolderResponse>(create);
  static CreateFolderResponse? _defaultInstance;
}

class DeleteFolderRequest extends $pb.GeneratedMessage {
  factory DeleteFolderRequest({
    $core.int? folderId,
  }) {
    final $result = create();
    if (folderId != null) {
      $result.folderId = folderId;
    }
    return $result;
  }
  DeleteFolderRequest._() : super();
  factory DeleteFolderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFolderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFolderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3, protoName: 'folderId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFolderRequest clone() => DeleteFolderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFolderRequest copyWith(void Function(DeleteFolderRequest) updates) => super.copyWith((message) => updates(message as DeleteFolderRequest)) as DeleteFolderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFolderRequest create() => DeleteFolderRequest._();
  DeleteFolderRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteFolderRequest> createRepeated() => $pb.PbList<DeleteFolderRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteFolderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFolderRequest>(create);
  static DeleteFolderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folderId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folderId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolderId() => clearField(1);
}

class DeleteFolderResponse extends $pb.GeneratedMessage {
  factory DeleteFolderResponse() => create();
  DeleteFolderResponse._() : super();
  factory DeleteFolderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFolderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFolderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFolderResponse clone() => DeleteFolderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFolderResponse copyWith(void Function(DeleteFolderResponse) updates) => super.copyWith((message) => updates(message as DeleteFolderResponse)) as DeleteFolderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFolderResponse create() => DeleteFolderResponse._();
  DeleteFolderResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteFolderResponse> createRepeated() => $pb.PbList<DeleteFolderResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteFolderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFolderResponse>(create);
  static DeleteFolderResponse? _defaultInstance;
}

class RenameFolderRequest extends $pb.GeneratedMessage {
  factory RenameFolderRequest({
    $core.int? folderId,
    $core.String? name,
  }) {
    final $result = create();
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RenameFolderRequest._() : super();
  factory RenameFolderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameFolderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RenameFolderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3, protoName: 'folderId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenameFolderRequest clone() => RenameFolderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenameFolderRequest copyWith(void Function(RenameFolderRequest) updates) => super.copyWith((message) => updates(message as RenameFolderRequest)) as RenameFolderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFolderRequest create() => RenameFolderRequest._();
  RenameFolderRequest createEmptyInstance() => create();
  static $pb.PbList<RenameFolderRequest> createRepeated() => $pb.PbList<RenameFolderRequest>();
  @$core.pragma('dart2js:noInline')
  static RenameFolderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameFolderRequest>(create);
  static RenameFolderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folderId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folderId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class RenameFolderResponse extends $pb.GeneratedMessage {
  factory RenameFolderResponse() => create();
  RenameFolderResponse._() : super();
  factory RenameFolderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RenameFolderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RenameFolderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RenameFolderResponse clone() => RenameFolderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RenameFolderResponse copyWith(void Function(RenameFolderResponse) updates) => super.copyWith((message) => updates(message as RenameFolderResponse)) as RenameFolderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenameFolderResponse create() => RenameFolderResponse._();
  RenameFolderResponse createEmptyInstance() => create();
  static $pb.PbList<RenameFolderResponse> createRepeated() => $pb.PbList<RenameFolderResponse>();
  @$core.pragma('dart2js:noInline')
  static RenameFolderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenameFolderResponse>(create);
  static RenameFolderResponse? _defaultInstance;
}

class MoveFolderRequest extends $pb.GeneratedMessage {
  factory MoveFolderRequest({
    $core.int? folderId,
    $core.int? folderToId,
  }) {
    final $result = create();
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (folderToId != null) {
      $result.folderToId = folderToId;
    }
    return $result;
  }
  MoveFolderRequest._() : super();
  factory MoveFolderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFolderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveFolderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3, protoName: 'folderId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'folderToId', $pb.PbFieldType.O3, protoName: 'folderToId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveFolderRequest clone() => MoveFolderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveFolderRequest copyWith(void Function(MoveFolderRequest) updates) => super.copyWith((message) => updates(message as MoveFolderRequest)) as MoveFolderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFolderRequest create() => MoveFolderRequest._();
  MoveFolderRequest createEmptyInstance() => create();
  static $pb.PbList<MoveFolderRequest> createRepeated() => $pb.PbList<MoveFolderRequest>();
  @$core.pragma('dart2js:noInline')
  static MoveFolderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFolderRequest>(create);
  static MoveFolderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get folderId => $_getIZ(0);
  @$pb.TagNumber(1)
  set folderId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get folderToId => $_getIZ(1);
  @$pb.TagNumber(2)
  set folderToId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderToId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderToId() => clearField(2);
}

class MoveFolderResponse extends $pb.GeneratedMessage {
  factory MoveFolderResponse() => create();
  MoveFolderResponse._() : super();
  factory MoveFolderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MoveFolderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MoveFolderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'folder'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MoveFolderResponse clone() => MoveFolderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MoveFolderResponse copyWith(void Function(MoveFolderResponse) updates) => super.copyWith((message) => updates(message as MoveFolderResponse)) as MoveFolderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MoveFolderResponse create() => MoveFolderResponse._();
  MoveFolderResponse createEmptyInstance() => create();
  static $pb.PbList<MoveFolderResponse> createRepeated() => $pb.PbList<MoveFolderResponse>();
  @$core.pragma('dart2js:noInline')
  static MoveFolderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MoveFolderResponse>(create);
  static MoveFolderResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
