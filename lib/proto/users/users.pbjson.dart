//
//  Generated code. Do not modify.
//  source: users/users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUsersRequestDescriptor instead')
const GetUsersRequest$json = {
  '1': 'GetUsersRequest',
  '2': [
    {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
  ],
};

/// Descriptor for `GetUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2Vyc1JlcXVlc3QSGgoIdXNlck5hbWUYASABKAlSCHVzZXJOYW1l');

@$core.Deprecated('Use getUsersResponseDescriptor instead')
const GetUsersResponse$json = {
  '1': 'GetUsersResponse',
  '2': [
    {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.users.Users', '10': 'data'},
  ],
};

/// Descriptor for `GetUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersResponseDescriptor = $convert.base64Decode(
    'ChBHZXRVc2Vyc1Jlc3BvbnNlEiAKBGRhdGEYASADKAsyDC51c2Vycy5Vc2Vyc1IEZGF0YQ==');

@$core.Deprecated('Use getContentUserRequestDescriptor instead')
const GetContentUserRequest$json = {
  '1': 'GetContentUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetContentUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContentUserRequestDescriptor = $convert.base64Decode(
    'ChVHZXRDb250ZW50VXNlclJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getContentUserResponseDescriptor instead')
const GetContentUserResponse$json = {
  '1': 'GetContentUserResponse',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 11, '6': '.users.Content', '10': 'data'},
  ],
};

/// Descriptor for `GetContentUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContentUserResponseDescriptor = $convert.base64Decode(
    'ChZHZXRDb250ZW50VXNlclJlc3BvbnNlEiIKBGRhdGEYASABKAsyDi51c2Vycy5Db250ZW50Ug'
    'RkYXRh');

@$core.Deprecated('Use usersDescriptor instead')
const Users$json = {
  '1': 'Users',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `Users`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersDescriptor = $convert.base64Decode(
    'CgVVc2VycxIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVlbWFpbBgDIA'
    'EoCVIFZW1haWw=');

@$core.Deprecated('Use contentDescriptor instead')
const Content$json = {
  '1': 'Content',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.users.File', '10': 'files'},
    {'1': 'folder', '3': 2, '4': 3, '5': 11, '6': '.users.Folder', '10': 'folder'},
    {'1': 'file_request_access', '3': 4, '4': 3, '5': 11, '6': '.users.File', '10': 'fileRequestAccess'},
    {'1': 'folder_request_access', '3': 3, '4': 3, '5': 11, '6': '.users.Folder', '10': 'folderRequestAccess'},
  ],
};

/// Descriptor for `Content`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentDescriptor = $convert.base64Decode(
    'CgdDb250ZW50EiEKBWZpbGVzGAEgAygLMgsudXNlcnMuRmlsZVIFZmlsZXMSJQoGZm9sZGVyGA'
    'IgAygLMg0udXNlcnMuRm9sZGVyUgZmb2xkZXISOwoTZmlsZV9yZXF1ZXN0X2FjY2VzcxgEIAMo'
    'CzILLnVzZXJzLkZpbGVSEWZpbGVSZXF1ZXN0QWNjZXNzEkEKFWZvbGRlcl9yZXF1ZXN0X2FjY2'
    'VzcxgDIAMoCzINLnVzZXJzLkZvbGRlclITZm9sZGVyUmVxdWVzdEFjY2Vzcw==');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'size', '3': 6, '4': 1, '5': 3, '10': 'size'},
    {'1': 'file_name', '3': 7, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_name_hash', '3': 8, '4': 1, '5': 9, '10': 'fileNameHash'},
    {'1': 'access_id', '3': 9, '4': 1, '5': 5, '10': 'accessId'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAmlkGAEgASgFUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgJUgljcmVhdGVkQXQSHQ'
    'oKdXBkYXRlZF9hdBgDIAEoCVIJdXBkYXRlZEF0EhcKB3VzZXJfaWQYBCABKAVSBnVzZXJJZBIb'
    'Cglmb2xkZXJfaWQYBSABKAVSCGZvbGRlcklkEhIKBHNpemUYBiABKANSBHNpemUSGwoJZmlsZV'
    '9uYW1lGAcgASgJUghmaWxlTmFtZRIkCg5maWxlX25hbWVfaGFzaBgIIAEoCVIMZmlsZU5hbWVI'
    'YXNoEhsKCWFjY2Vzc19pZBgJIAEoBVIIYWNjZXNzSWQ=');

@$core.Deprecated('Use folderDescriptor instead')
const Folder$json = {
  '1': 'Folder',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'access_id', '3': 6, '4': 1, '5': 5, '10': 'accessId'},
    {'1': 'name_folder', '3': 7, '4': 1, '5': 9, '10': 'nameFolder'},
  ],
};

/// Descriptor for `Folder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List folderDescriptor = $convert.base64Decode(
    'CgZGb2xkZXISDgoCaWQYASABKAVSAmlkEh0KCmNyZWF0ZWRfYXQYAiABKAlSCWNyZWF0ZWRBdB'
    'IdCgp1cGRhdGVkX2F0GAMgASgJUgl1cGRhdGVkQXQSFwoHdXNlcl9pZBgEIAEoBVIGdXNlcklk'
    'EhsKCWZvbGRlcl9pZBgFIAEoBVIIZm9sZGVySWQSGwoJYWNjZXNzX2lkGAYgASgFUghhY2Nlc3'
    'NJZBIfCgtuYW1lX2ZvbGRlchgHIAEoCVIKbmFtZUZvbGRlcg==');

