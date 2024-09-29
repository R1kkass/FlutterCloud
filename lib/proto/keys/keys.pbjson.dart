//
//  Generated code. Do not modify.
//  source: keys.proto
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
    {'1': 'chunk', '3': 2, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `FileUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadRequestDescriptor = $convert.base64Decode(
    'ChFGaWxlVXBsb2FkUmVxdWVzdBIUCgVjaHVuaxgCIAEoDFIFY2h1bms=');

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

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use fileDownloadResponseDescriptor instead')
const FileDownloadResponse$json = {
  '1': 'FileDownloadResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
  ],
};

/// Descriptor for `FileDownloadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDownloadResponseDescriptor = $convert.base64Decode(
    'ChRGaWxlRG93bmxvYWRSZXNwb25zZRIUCgVjaHVuaxgBIAEoDFIFY2h1bms=');

