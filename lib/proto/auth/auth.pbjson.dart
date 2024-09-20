//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW4=');

@$core.Deprecated('Use registrationRequestDescriptor instead')
const RegistrationRequest$json = {
  '1': 'RegistrationRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RegistrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationRequestDescriptor = $convert.base64Decode(
    'ChNSZWdpc3RyYXRpb25SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZB'
    'gCIAEoCVIIcGFzc3dvcmQSEgoEbmFtZRgDIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use registrationResponseDescriptor instead')
const RegistrationResponse$json = {
  '1': 'RegistrationResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `RegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationResponseDescriptor = $convert.base64Decode(
    'ChRSZWdpc3RyYXRpb25SZXNwb25zZRIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2'
    'Vu');

@$core.Deprecated('Use dHConnectRequestDescriptor instead')
const DHConnectRequest$json = {
  '1': 'DHConnectRequest',
};

/// Descriptor for `DHConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dHConnectRequestDescriptor = $convert.base64Decode(
    'ChBESENvbm5lY3RSZXF1ZXN0');

@$core.Deprecated('Use dHConnectResponseDescriptor instead')
const DHConnectResponse$json = {
  '1': 'DHConnectResponse',
  '2': [
    {'1': 'p', '3': 1, '4': 1, '5': 9, '10': 'p'},
    {'1': 'g', '3': 2, '4': 1, '5': 3, '10': 'g'},
    {'1': 'b', '3': 3, '4': 1, '5': 9, '10': 'b'},
  ],
};

/// Descriptor for `DHConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dHConnectResponseDescriptor = $convert.base64Decode(
    'ChFESENvbm5lY3RSZXNwb25zZRIMCgFwGAEgASgJUgFwEgwKAWcYAiABKANSAWcSDAoBYhgDIA'
    'EoCVIBYg==');

@$core.Deprecated('Use dHSecondConnectRequestDescriptor instead')
const DHSecondConnectRequest$json = {
  '1': 'DHSecondConnectRequest',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 9, '10': 'a'},
  ],
};

/// Descriptor for `DHSecondConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dHSecondConnectRequestDescriptor = $convert.base64Decode(
    'ChZESFNlY29uZENvbm5lY3RSZXF1ZXN0EgwKAWEYASABKAlSAWE=');

@$core.Deprecated('Use dHSecondConnectResponseDescriptor instead')
const DHSecondConnectResponse$json = {
  '1': 'DHSecondConnectResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DHSecondConnectResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dHSecondConnectResponseDescriptor = $convert.base64Decode(
    'ChdESFNlY29uZENvbm5lY3RSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

