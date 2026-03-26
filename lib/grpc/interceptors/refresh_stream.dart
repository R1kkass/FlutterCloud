import 'dart:async';

import 'package:TalkSpace/grpc/auth_grpc.dart';
import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:grpc/grpc.dart';

class RefreshStream {
  final _authGrpc = AuthGrpc();

  Future<StreamSubscription<T>?> listen<T>(Stream<T> stream, void Function(T)? onData) async {
    try {
      var s = stream.listen(onData);
      return s;
    } on GrpcError catch(e) {
      if (e.code == StatusCode.unauthenticated && HiveBoxes.listToken.get(jwtDecode().email) != null) {
        await _authGrpc.refresh();
        return stream.listen(onData);
      }
      rethrow;
    }

    return null;
  }
}