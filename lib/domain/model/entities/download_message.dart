import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';

class DownloadMessage {
  double percentDownload;
  Function()? retry;
  FileDownloadStatusEnum status;

  DownloadMessage({
    this.percentDownload = 0.0,
    this.status = FileDownloadStatusEnum.downloading,
    this.retry,
  });
}
