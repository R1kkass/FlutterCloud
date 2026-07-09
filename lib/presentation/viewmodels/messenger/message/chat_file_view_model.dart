import 'dart:io';

import 'package:TalkSpace/data/sources/local/message_file_local_data_source.dart';
import 'package:TalkSpace/domain/dto/stream_dto.dart';
import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/model/enums/file_download_status.enum.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/services/create_downloaded_file.dart';
import 'package:TalkSpace/services/get_download_path.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';

class ChatFileViewModel extends ChangeNotifier {
  bool downloaded = false;
  bool isError = false;
  bool isLoading = false;
  File? file;
  late MessageRepository _messageRepository;
  late MessageFileLocalDataSource _messageFileLocalDataSource;
  late MessageFile messageFile;

  update({
    required MessageRepository messageRepository,
    required MessageFileLocalDataSource messageFileLocalDataSource,
    required MessageFile messageFile
  }) {
    _messageRepository = messageRepository;
    _messageFileLocalDataSource = messageFileLocalDataSource;
    this.messageFile = messageFile;
  }

  successDownload() {
    messageFile.downloadMessage?.status = FileDownloadStatusEnum.success;
    messageFile.downloadMessage?.percentDownload = 100;
    notifyListeners();
  }

  Future downloadFile(Message message) async {
    try {
      if (messageFile.uploadFileMessage != null) {
        file = messageFile.uploadFileMessage!.file;
        downloaded = true;
        return;
      }

      file = _messageFileLocalDataSource.getDownloadedFile(messageFile);
      if (file != null) {
        downloaded = true;
        successDownload();
        return;
      }
      isLoading = true;
      notifyListeners();
      var downloadPath = await getDownloadPath() ?? "";
      _messageRepository.downloadFile(
        message: message,
        messageFile: messageFile,
        streamDTO: StreamDTO(
          onListen: (double percentDownloaded) {
            messageFile.downloadMessage?.percentDownload = percentDownloaded;
            notifyListeners();
          },
          onDone: (List<int> chunks) {
            successDownload();
            var path = "$downloadPath/${messageFile.fileName}";
            file = CreateDownloadedFile().createFile(Uint8List.fromList(chunks), path);
            _messageFileLocalDataSource.addDownloadedFile(messageFile, file!);
            downloaded = true;
            isError = false;
          },
          onError: (_) {
            rejectDownload();
          }
        ),
      );

    } catch (e) {
      rejectDownload();
      isError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  rejectDownload() {
    messageFile.downloadMessage?.status = FileDownloadStatusEnum.reject;
    notifyListeners();
  }

  openChatFile() async {
    await OpenFile.open(
      file!.path
    );
  }
}