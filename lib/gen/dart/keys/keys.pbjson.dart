//
//  Generated code. Do not modify.
//  source: keys/keys.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use keysUploadRequestDescriptor instead')
const KeysUploadRequest$json = {
  '1': 'KeysUploadRequest',
  '2': [
    {'1': 'chunk', '3': 2, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `KeysUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keysUploadRequestDescriptor = $convert.base64Decode(
    'ChFLZXlzVXBsb2FkUmVxdWVzdBIUCgVjaHVuaxgCIAEoDFIFY2h1bms=');

@$core.Deprecated('Use keysUploadResponseDescriptor instead')
const KeysUploadResponse$json = {
  '1': 'KeysUploadResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `KeysUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keysUploadResponseDescriptor = $convert.base64Decode(
    'ChJLZXlzVXBsb2FkUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use keyDownloadResponseDescriptor instead')
const KeyDownloadResponse$json = {
  '1': 'KeyDownloadResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `KeyDownloadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyDownloadResponseDescriptor = $convert.base64Decode(
    'ChNLZXlEb3dubG9hZFJlc3BvbnNlEhQKBWNodW5rGAEgASgMUgVjaHVuaw==');

