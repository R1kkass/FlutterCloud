import 'dart:async';

class UploadFile {
  final int id;
  final String fileName;
  int size;
  // StreamSubscription<dynamic>? stream;

  UploadFile({
    required this.id,
    required this.fileName,
    required this.size,
    // this.stream
  });
}
