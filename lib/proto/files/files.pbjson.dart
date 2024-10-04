//
//  Generated code. Do not modify.
//  source: files/files.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fileUploadRequestDescriptor instead')
const FileUploadRequest$json = {
  '1': 'FileUploadRequest',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'folderId', '3': 3, '4': 1, '5': 13, '10': 'folderId'},
  ],
};

/// Descriptor for `FileUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadRequestDescriptor = $convert.base64Decode(
    'ChFGaWxlVXBsb2FkUmVxdWVzdBIUCgVjaHVuaxgBIAEoDFIFY2h1bmsSGgoIZmlsZU5hbWUYAi'
    'ABKAlSCGZpbGVOYW1lEhoKCGZvbGRlcklkGAMgASgNUghmb2xkZXJJZA==');

@$core.Deprecated('Use fileUploadResponseDescriptor instead')
const FileUploadResponse$json = {
  '1': 'FileUploadResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `FileUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadResponseDescriptor = $convert.base64Decode(
    'ChJGaWxlVXBsb2FkUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use fileDownloadRequestDescriptor instead')
const FileDownloadRequest$json = {
  '1': 'FileDownloadRequest',
  '2': [
    {'1': 'fileId', '3': 1, '4': 1, '5': 13, '10': 'fileId'},
    {'1': 'folderId', '3': 2, '4': 1, '5': 13, '10': 'folderId'},
  ],
};

/// Descriptor for `FileDownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDownloadRequestDescriptor = $convert.base64Decode(
    'ChNGaWxlRG93bmxvYWRSZXF1ZXN0EhYKBmZpbGVJZBgBIAEoDVIGZmlsZUlkEhoKCGZvbGRlck'
    'lkGAIgASgNUghmb2xkZXJJZA==');

@$core.Deprecated('Use fileDownloadResponseDescriptor instead')
const FileDownloadResponse$json = {
  '1': 'FileDownloadResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'fileName', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'progress', '3': 3, '4': 1, '5': 2, '10': 'progress'},
  ],
};

/// Descriptor for `FileDownloadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDownloadResponseDescriptor = $convert.base64Decode(
    'ChRGaWxlRG93bmxvYWRSZXNwb25zZRIUCgVjaHVuaxgBIAEoDFIFY2h1bmsSGgoIZmlsZU5hbW'
    'UYAiABKAlSCGZpbGVOYW1lEhoKCHByb2dyZXNzGAMgASgCUghwcm9ncmVzcw==');

