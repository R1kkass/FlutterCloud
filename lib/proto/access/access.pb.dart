//
//  Generated code. Do not modify.
//  source: access.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RequestAccess extends $pb.GeneratedMessage {
  factory RequestAccess({
    $core.int? folderId,
    $core.int? fileId,
    $core.int? userId,
  }) {
    final $result = create();
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  RequestAccess._() : super();
  factory RequestAccess.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestAccess.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestAccess', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestAccess clone() => RequestAccess()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestAccess copyWith(void Function(RequestAccess) updates) => super.copyWith((message) => updates(message as RequestAccess)) as RequestAccess;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestAccess create() => RequestAccess._();
  RequestAccess createEmptyInstance() => create();
  static $pb.PbList<RequestAccess> createRepeated() => $pb.PbList<RequestAccess>();
  @$core.pragma('dart2js:noInline')
  static RequestAccess getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestAccess>(create);
  static RequestAccess? _defaultInstance;

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
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

class ResponseAccess extends $pb.GeneratedMessage {
  factory ResponseAccess({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ResponseAccess._() : super();
  factory ResponseAccess.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseAccess.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResponseAccess', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseAccess clone() => ResponseAccess()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseAccess copyWith(void Function(ResponseAccess) updates) => super.copyWith((message) => updates(message as ResponseAccess)) as ResponseAccess;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseAccess create() => ResponseAccess._();
  ResponseAccess createEmptyInstance() => create();
  static $pb.PbList<ResponseAccess> createRepeated() => $pb.PbList<ResponseAccess>();
  @$core.pragma('dart2js:noInline')
  static ResponseAccess getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseAccess>(create);
  static ResponseAccess? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetAccessesResponse extends $pb.GeneratedMessage {
  factory GetAccessesResponse({
    $core.Iterable<RequestAccessData>? accesses,
  }) {
    final $result = create();
    if (accesses != null) {
      $result.accesses.addAll(accesses);
    }
    return $result;
  }
  GetAccessesResponse._() : super();
  factory GetAccessesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccessesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccessesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..pc<RequestAccessData>(1, _omitFieldNames ? '' : 'accesses', $pb.PbFieldType.PM, subBuilder: RequestAccessData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccessesResponse clone() => GetAccessesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccessesResponse copyWith(void Function(GetAccessesResponse) updates) => super.copyWith((message) => updates(message as GetAccessesResponse)) as GetAccessesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccessesResponse create() => GetAccessesResponse._();
  GetAccessesResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccessesResponse> createRepeated() => $pb.PbList<GetAccessesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccessesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccessesResponse>(create);
  static GetAccessesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RequestAccessData> get accesses => $_getList(0);
}

class RequestAccessData extends $pb.GeneratedMessage {
  factory RequestAccessData({
    $core.int? id,
    $core.int? userId,
    $core.int? currentUserId,
    $core.int? fileId,
    $core.int? folderId,
    $core.int? statusId,
    User? user,
    User? curentUser,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (currentUserId != null) {
      $result.currentUserId = currentUserId;
    }
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (folderId != null) {
      $result.folderId = folderId;
    }
    if (statusId != null) {
      $result.statusId = statusId;
    }
    if (user != null) {
      $result.user = user;
    }
    if (curentUser != null) {
      $result.curentUser = curentUser;
    }
    return $result;
  }
  RequestAccessData._() : super();
  factory RequestAccessData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestAccessData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequestAccessData', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'currentUserId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'fileId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'folderId', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'statusId', $pb.PbFieldType.O3)
    ..aOM<User>(7, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOM<User>(8, _omitFieldNames ? '' : 'curentUser', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestAccessData clone() => RequestAccessData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestAccessData copyWith(void Function(RequestAccessData) updates) => super.copyWith((message) => updates(message as RequestAccessData)) as RequestAccessData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestAccessData create() => RequestAccessData._();
  RequestAccessData createEmptyInstance() => create();
  static $pb.PbList<RequestAccessData> createRepeated() => $pb.PbList<RequestAccessData>();
  @$core.pragma('dart2js:noInline')
  static RequestAccessData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestAccessData>(create);
  static RequestAccessData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get currentUserId => $_getIZ(2);
  @$pb.TagNumber(3)
  set currentUserId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get fileId => $_getIZ(3);
  @$pb.TagNumber(4)
  set fileId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFileId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get folderId => $_getIZ(4);
  @$pb.TagNumber(5)
  set folderId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get statusId => $_getIZ(5);
  @$pb.TagNumber(6)
  set statusId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatusId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatusId() => clearField(6);

  @$pb.TagNumber(7)
  User get user => $_getN(6);
  @$pb.TagNumber(7)
  set user(User v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearUser() => clearField(7);
  @$pb.TagNumber(7)
  User ensureUser() => $_ensure(6);

  @$pb.TagNumber(8)
  User get curentUser => $_getN(7);
  @$pb.TagNumber(8)
  set curentUser(User v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCurentUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurentUser() => clearField(8);
  @$pb.TagNumber(8)
  User ensureCurentUser() => $_ensure(7);
}

class User extends $pb.GeneratedMessage {
  factory User({
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
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'User', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'access'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
