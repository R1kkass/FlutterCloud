//
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetUsersRequest extends $pb.GeneratedMessage {
  factory GetUsersRequest({
    $core.String? userName,
  }) {
    final $result = create();
    if (userName != null) {
      $result.userName = userName;
    }
    return $result;
  }
  GetUsersRequest._() : super();
  factory GetUsersRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetUsersRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetUsersRequest clone() => GetUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetUsersRequest copyWith(void Function(GetUsersRequest) updates) =>
      super.copyWith((message) => updates(message as GetUsersRequest))
          as GetUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUsersRequest create() => GetUsersRequest._();
  GetUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetUsersRequest> createRepeated() =>
      $pb.PbList<GetUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUsersRequest>(create);
  static GetUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);
}

class GetUsersResponse extends $pb.GeneratedMessage {
  factory GetUsersResponse({
    $core.Iterable<Users>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data.addAll(data);
    }
    return $result;
  }
  GetUsersResponse._() : super();
  factory GetUsersResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetUsersResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUsersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..pc<Users>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.PM,
        subBuilder: Users.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetUsersResponse clone() => GetUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetUsersResponse copyWith(void Function(GetUsersResponse) updates) =>
      super.copyWith((message) => updates(message as GetUsersResponse))
          as GetUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUsersResponse create() => GetUsersResponse._();
  GetUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetUsersResponse> createRepeated() =>
      $pb.PbList<GetUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUsersResponse>(create);
  static GetUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Users> get data => $_getList(0);
}

class GetContentUserRequest extends $pb.GeneratedMessage {
  factory GetContentUserRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetContentUserRequest._() : super();
  factory GetContentUserRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetContentUserRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetContentUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetContentUserRequest clone() =>
      GetContentUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetContentUserRequest copyWith(
          void Function(GetContentUserRequest) updates) =>
      super.copyWith((message) => updates(message as GetContentUserRequest))
          as GetContentUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContentUserRequest create() => GetContentUserRequest._();
  GetContentUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetContentUserRequest> createRepeated() =>
      $pb.PbList<GetContentUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetContentUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetContentUserRequest>(create);
  static GetContentUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetContentUserResponse extends $pb.GeneratedMessage {
  factory GetContentUserResponse({
    Content? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  GetContentUserResponse._() : super();
  factory GetContentUserResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetContentUserResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetContentUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..aOM<Content>(1, _omitFieldNames ? '' : 'data', subBuilder: Content.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetContentUserResponse clone() =>
      GetContentUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetContentUserResponse copyWith(
          void Function(GetContentUserResponse) updates) =>
      super.copyWith((message) => updates(message as GetContentUserResponse))
          as GetContentUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContentUserResponse create() => GetContentUserResponse._();
  GetContentUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetContentUserResponse> createRepeated() =>
      $pb.PbList<GetContentUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContentUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetContentUserResponse>(create);
  static GetContentUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Content get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(Content v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  Content ensureData() => $_ensure(0);
}

class Users extends $pb.GeneratedMessage {
  factory Users({
    $core.int? id,
    $core.String? name,
    $core.String? email,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  Users._() : super();
  factory Users.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Users.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Users',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Users clone() => Users()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Users copyWith(void Function(Users) updates) =>
      super.copyWith((message) => updates(message as Users)) as Users;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Users create() => Users._();
  Users createEmptyInstance() => create();
  static $pb.PbList<Users> createRepeated() => $pb.PbList<Users>();
  @$core.pragma('dart2js:noInline')
  static Users getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Users>(create);
  static Users? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class Content extends $pb.GeneratedMessage {
  factory Content({
    $core.Iterable<File>? files,
    $core.Iterable<Folder>? folder,
    $core.Iterable<Folder>? folderRequestAccess,
    $core.Iterable<File>? fileRequestAccess,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    if (folder != null) {
      $result.folder.addAll(folder);
    }
    if (folderRequestAccess != null) {
      $result.folderRequestAccess.addAll(folderRequestAccess);
    }
    if (fileRequestAccess != null) {
      $result.fileRequestAccess.addAll(fileRequestAccess);
    }
    return $result;
  }
  Content._() : super();
  factory Content.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Content.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Content',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..pc<File>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM,
        subBuilder: File.create)
    ..pc<Folder>(2, _omitFieldNames ? '' : 'folder', $pb.PbFieldType.PM,
        subBuilder: Folder.create)
    ..pc<Folder>(
        3, _omitFieldNames ? '' : 'folderRequestAccess', $pb.PbFieldType.PM,
        subBuilder: Folder.create)
    ..pc<File>(
        4, _omitFieldNames ? '' : 'fileRequestAccess', $pb.PbFieldType.PM,
        subBuilder: File.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Content clone() => Content()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Content copyWith(void Function(Content) updates) =>
      super.copyWith((message) => updates(message as Content)) as Content;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Content create() => Content._();
  Content createEmptyInstance() => create();
  static $pb.PbList<Content> createRepeated() => $pb.PbList<Content>();
  @$core.pragma('dart2js:noInline')
  static Content getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Content>(create);
  static Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<File> get files => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Folder> get folder => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Folder> get folderRequestAccess => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<File> get fileRequestAccess => $_getList(3);
}

class File extends $pb.GeneratedMessage {
  factory File({
    $core.int? id,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    $fixnum.Int64? size,
    $core.String? fileName,
    $core.String? fileNameHash,
    $core.int? accessId,
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
    if (size != null) {
      $result.size = size;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (fileNameHash != null) {
      $result.fileNameHash = fileNameHash;
    }
    if (accessId != null) {
      $result.accessId = accessId;
    }
    return $result;
  }
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  factory File.fromJsonCustom($core.Map<$core.String, $core.dynamic> obj) =>
      File(
        fileName: obj["file_name"],
        id: obj["id"],
        fileNameHash: obj["file_name_hash"],
        userId: obj["user_id"],
        size: $fixnum.Int64(obj["size"]),
        accessId: obj["access_id"],
        folderId: obj["folder_id"] == "" ? 0 : obj["folder_id"],
        createdAt: obj["created_at"],
        updatedAt: obj["updated_at"],
      );

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'File',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'createdAt')
    ..aOS(3, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..aInt64(6, _omitFieldNames ? '' : 'size')
    ..aOS(7, _omitFieldNames ? '' : 'fileName')
    ..aOS(8, _omitFieldNames ? '' : 'fileNameHash')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'accessId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  File copyWith(void Function(File) updates) =>
      super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdAt($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updatedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set updatedAt($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get size => $_getI64(5);
  @$pb.TagNumber(6)
  set size($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fileName => $_getSZ(6);
  @$pb.TagNumber(7)
  set fileName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFileName() => $_has(6);
  @$pb.TagNumber(7)
  void clearFileName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get fileNameHash => $_getSZ(7);
  @$pb.TagNumber(8)
  set fileNameHash($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFileNameHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearFileNameHash() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get accessId => $_getIZ(8);
  @$pb.TagNumber(9)
  set accessId($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAccessId() => $_has(8);
  @$pb.TagNumber(9)
  void clearAccessId() => clearField(9);
}

class Folder extends $pb.GeneratedMessage {
  factory Folder({
    $core.int? id,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.int? userId,
    $core.int? folderId,
    $core.int? accessId,
    $core.String? nameFolder,
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
    if (accessId != null) {
      $result.accessId = accessId;
    }
    if (nameFolder != null) {
      $result.nameFolder = nameFolder;
    }
    return $result;
  }
  Folder._() : super();
  factory Folder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Folder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  factory Folder.fromJsonCustom($core.Map<$core.String, $core.dynamic> obj) =>
      Folder(
        nameFolder: obj["name_folder"],
        id: obj["id"],
        userId: obj["user_id"],
        accessId: obj["access_id"],
        folderId: obj["folder_id"] == "" ? 0 : obj["folder_id"],
        createdAt: obj["created_at"],
        updatedAt: obj["updated_at"],
      );

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Folder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'users'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'createdAt')
    ..aOS(3, _omitFieldNames ? '' : 'updatedAt')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'accessId', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'nameFolder')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Folder clone() => Folder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Folder copyWith(void Function(Folder) updates) =>
      super.copyWith((message) => updates(message as Folder)) as Folder;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Folder create() => Folder._();
  Folder createEmptyInstance() => create();
  static $pb.PbList<Folder> createRepeated() => $pb.PbList<Folder>();
  @$core.pragma('dart2js:noInline')
  static Folder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Folder>(create);
  static Folder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get createdAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set createdAt($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get updatedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set updatedAt($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get accessId => $_getIZ(5);
  @$pb.TagNumber(6)
  set accessId($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAccessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAccessId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get nameFolder => $_getSZ(6);
  @$pb.TagNumber(7)
  set nameFolder($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNameFolder() => $_has(6);
  @$pb.TagNumber(7)
  void clearNameFolder() => clearField(7);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
