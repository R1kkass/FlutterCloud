//
//  Generated code. Do not modify.
//  source: access.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use requestAccessDescriptor instead')
const RequestAccess$json = {
  '1': 'RequestAccess',
  '2': [
    {'1': 'folder_id', '3': 1, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'file_id', '3': 2, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `RequestAccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestAccessDescriptor = $convert.base64Decode(
    'Cg1SZXF1ZXN0QWNjZXNzEhsKCWZvbGRlcl9pZBgBIAEoBVIIZm9sZGVySWQSFwoHZmlsZV9pZB'
    'gCIAEoBVIGZmlsZUlkEhcKB3VzZXJfaWQYAyABKAVSBnVzZXJJZA==');

@$core.Deprecated('Use responseAccessDescriptor instead')
const ResponseAccess$json = {
  '1': 'ResponseAccess',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ResponseAccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseAccessDescriptor = $convert.base64Decode(
    'Cg5SZXNwb25zZUFjY2VzcxIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getAccessesResponseDescriptor instead')
const GetAccessesResponse$json = {
  '1': 'GetAccessesResponse',
  '2': [
    {'1': 'accesses', '3': 1, '4': 3, '5': 11, '6': '.access.RequestAccessData', '10': 'accesses'},
  ],
};

/// Descriptor for `GetAccessesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccessesResponseDescriptor = $convert.base64Decode(
    'ChNHZXRBY2Nlc3Nlc1Jlc3BvbnNlEjUKCGFjY2Vzc2VzGAEgAygLMhkuYWNjZXNzLlJlcXVlc3'
    'RBY2Nlc3NEYXRhUghhY2Nlc3Nlcw==');

@$core.Deprecated('Use requestAccessDataDescriptor instead')
const RequestAccessData$json = {
  '1': 'RequestAccessData',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'current_user_id', '3': 3, '4': 1, '5': 5, '10': 'currentUserId'},
    {'1': 'file_id', '3': 4, '4': 1, '5': 5, '10': 'fileId'},
    {'1': 'folder_id', '3': 5, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'status_id', '3': 6, '4': 1, '5': 5, '10': 'statusId'},
    {'1': 'user', '3': 7, '4': 1, '5': 11, '6': '.access.User', '10': 'user'},
    {'1': 'curent_user', '3': 8, '4': 1, '5': 11, '6': '.access.User', '10': 'curentUser'},
  ],
};

/// Descriptor for `RequestAccessData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestAccessDataDescriptor = $convert.base64Decode(
    'ChFSZXF1ZXN0QWNjZXNzRGF0YRIOCgJpZBgBIAEoBVICaWQSFwoHdXNlcl9pZBgCIAEoBVIGdX'
    'NlcklkEiYKD2N1cnJlbnRfdXNlcl9pZBgDIAEoBVINY3VycmVudFVzZXJJZBIXCgdmaWxlX2lk'
    'GAQgASgFUgZmaWxlSWQSGwoJZm9sZGVyX2lkGAUgASgFUghmb2xkZXJJZBIbCglzdGF0dXNfaW'
    'QYBiABKAVSCHN0YXR1c0lkEiAKBHVzZXIYByABKAsyDC5hY2Nlc3MuVXNlclIEdXNlchItCgtj'
    'dXJlbnRfdXNlchgIIAEoCzIMLmFjY2Vzcy5Vc2VyUgpjdXJlbnRVc2Vy');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBWVtYWlsGAMgAS'
    'gJUgVlbWFpbA==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

