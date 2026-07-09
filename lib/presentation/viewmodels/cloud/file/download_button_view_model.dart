import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/domain/model/response/file/index.dart';
import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/common_file_download.dart';
import 'package:flutter/foundation.dart';

class DownloadButtonViewModel extends ChangeNotifier {
  CommonFileDownload commonFileDownload;
  late FileRepository _fileRepository;

  DownloadButtonViewModel({
    required this.commonFileDownload,
    required FileRepository fileRepository
  }) {
    _fileRepository = fileRepository;
  }

  downloadFile(File file, void Function(FileDownloadResponse, DecodedBytes)? callback) async {
    try {
      var stream = await _fileRepository.downloadFile(file, (data, decodedData) {
        commonFileDownload.plusDownloadingFile(file, data.chunk.length);
        if (data.progress >= 100) {
          commonFileDownload.changeStatus(file, FileDownloadStatusEnum.success);
        }

        if (callback != null) {
          callback(data, decodedData);
        }
      });

      commonFileDownload.add(file, stream);
    } catch (e) {
      commonFileDownload.changeStatus(file, FileDownloadStatusEnum.reject);
      rethrow;
    }
    }
}

