//
//  Generated code. Do not modify.
//  source: folder/folder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createFolderRequestDescriptor instead')
const CreateFolderRequest$json = {
  '1': 'CreateFolderRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'folderId', '3': 2, '4': 1, '5': 5, '10': 'folderId'},
  ],
};

/// Descriptor for `CreateFolderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFolderRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVGb2xkZXJSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSGgoIZm9sZGVySWQYAi'
    'ABKAVSCGZvbGRlcklk');

@$core.Deprecated('Use createFolderResponseDescriptor instead')
const CreateFolderResponse$json = {
  '1': 'CreateFolderResponse',
};

/// Descriptor for `CreateFolderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFolderResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVGb2xkZXJSZXNwb25zZQ==');

@$core.Deprecated('Use deleteFolderRequestDescriptor instead')
const DeleteFolderRequest$json = {
  '1': 'DeleteFolderRequest',
  '2': [
    {'1': 'folderId', '3': 1, '4': 1, '5': 5, '10': 'folderId'},
  ],
};

/// Descriptor for `DeleteFolderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFolderRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVGb2xkZXJSZXF1ZXN0EhoKCGZvbGRlcklkGAEgASgFUghmb2xkZXJJZA==');

@$core.Deprecated('Use deleteFolderResponseDescriptor instead')
const DeleteFolderResponse$json = {
  '1': 'DeleteFolderResponse',
};

/// Descriptor for `DeleteFolderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFolderResponseDescriptor = $convert.base64Decode(
    'ChREZWxldGVGb2xkZXJSZXNwb25zZQ==');

@$core.Deprecated('Use renameFolderRequestDescriptor instead')
const RenameFolderRequest$json = {
  '1': 'RenameFolderRequest',
  '2': [
    {'1': 'folderId', '3': 1, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RenameFolderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameFolderRequestDescriptor = $convert.base64Decode(
    'ChNSZW5hbWVGb2xkZXJSZXF1ZXN0EhoKCGZvbGRlcklkGAEgASgFUghmb2xkZXJJZBISCgRuYW'
    '1lGAIgASgJUgRuYW1l');

@$core.Deprecated('Use renameFolderResponseDescriptor instead')
const RenameFolderResponse$json = {
  '1': 'RenameFolderResponse',
};

/// Descriptor for `RenameFolderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameFolderResponseDescriptor = $convert.base64Decode(
    'ChRSZW5hbWVGb2xkZXJSZXNwb25zZQ==');

@$core.Deprecated('Use moveFolderRequestDescriptor instead')
const MoveFolderRequest$json = {
  '1': 'MoveFolderRequest',
  '2': [
    {'1': 'folderId', '3': 1, '4': 1, '5': 5, '10': 'folderId'},
    {'1': 'folderToId', '3': 2, '4': 1, '5': 5, '10': 'folderToId'},
  ],
};

/// Descriptor for `MoveFolderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveFolderRequestDescriptor = $convert.base64Decode(
    'ChFNb3ZlRm9sZGVyUmVxdWVzdBIaCghmb2xkZXJJZBgBIAEoBVIIZm9sZGVySWQSHgoKZm9sZG'
    'VyVG9JZBgCIAEoBVIKZm9sZGVyVG9JZA==');

@$core.Deprecated('Use moveFolderResponseDescriptor instead')
const MoveFolderResponse$json = {
  '1': 'MoveFolderResponse',
};

/// Descriptor for `MoveFolderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moveFolderResponseDescriptor = $convert.base64Decode(
    'ChJNb3ZlRm9sZGVyUmVzcG9uc2U=');

