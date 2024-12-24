//
//  Generated code. Do not modify.
//  source: auth/auth.proto
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
};

/// Descriptor for `RegistrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registrationResponseDescriptor = $convert.base64Decode(
    'ChRSZWdpc3RyYXRpb25SZXNwb25zZQ==');

@$core.Deprecated('Use dHConnectRequestDescriptor instead')
const DHConnectRequest$json = {
  '1': 'DHConnectRequest',
};

/// Descriptor for `DHConnectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dHConnectRequestDescriptor = $convert.base64Decode(
    'ChBESENvbm5lY3RSZXF1ZXN0');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

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

@$core.Deprecated('Use submitEmailRequestDescriptor instead')
const SubmitEmailRequest$json = {
  '1': 'SubmitEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'key', '3': 3, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `SubmitEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitEmailRequestDescriptor = $convert.base64Decode(
    'ChJTdWJtaXRFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZBIQCgNrZXkYAyABKAlSA2tleQ==');

@$core.Deprecated('Use submitEmailResponseDescriptor instead')
const SubmitEmailResponse$json = {
  '1': 'SubmitEmailResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `SubmitEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitEmailResponseDescriptor = $convert.base64Decode(
    'ChNTdWJtaXRFbWFpbFJlc3BvbnNlEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW'
    '4=');

@$core.Deprecated('Use sendNewMailKeyRequestDescriptor instead')
const SendNewMailKeyRequest$json = {
  '1': 'SendNewMailKeyRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SendNewMailKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendNewMailKeyRequestDescriptor = $convert.base64Decode(
    'ChVTZW5kTmV3TWFpbEtleVJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3'
    'JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use sendNewMailKeyResponseDescriptor instead')
const SendNewMailKeyResponse$json = {
  '1': 'SendNewMailKeyResponse',
};

/// Descriptor for `SendNewMailKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendNewMailKeyResponseDescriptor = $convert.base64Decode(
    'ChZTZW5kTmV3TWFpbEtleVJlc3BvbnNl');

