import 'package:flutter_application_2/consts/domen.dart';
import 'package:flutter_application_2/proto/keys/keys.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';

ClientChannel channel = ClientChannel(
  ipServer,
  port: 50051,
  options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
);

class KeysGrpc {
  final _stub = KeysGreeterClient(channel);
  CallOptions _options(){
    return CallOptions(metadata: {
      "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVhc3l0ZWthQGdtYWlsLmNvbSIsImV4cCI6MTcyNzg4NTc4MH0.IA8ZpXYci0XT_cr4liAchcWm6N-wxA-ZIKFCTLDeNXY",
    });
  }

  Future<FileUploadResponse> uploadFile(FileUploadRequest request) {
    return _stub.uploadKeys(request, options: _options());
  }

  ResponseStream<FileDownloadResponse> downloadKeys() {
    return _stub.downloadKeys(Empty(), options: _options());
  }
}

void main() {
  var keys = KeysGrpc();
  keys.downloadKeys().forEach((e) {
print(e);
  });
  return;
}