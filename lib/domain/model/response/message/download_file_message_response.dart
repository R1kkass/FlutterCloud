class DownloadFileMessageResponse {
  List<int> chunk;
  double progress;

  DownloadFileMessageResponse({
    required this.chunk,
    required this.progress,
  });
}
