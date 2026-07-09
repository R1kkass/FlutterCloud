class FileDownloadResponse {
  List<int> chunk;
  String fileName;
  double progress;

  FileDownloadResponse({
    required this.fileName,
    required this.chunk,
    required this.progress,
  });
}