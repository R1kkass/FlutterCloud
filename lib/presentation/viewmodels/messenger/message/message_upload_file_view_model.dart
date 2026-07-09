import 'dart:io';

import 'package:TalkSpace/domain/model/entities/message.dart';
import 'package:TalkSpace/domain/model/entities/message_file.dart';
import 'package:TalkSpace/domain/model/entities/upload_file_message.dart';
import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/domain/model/enums/file_upload_status.enum.dart';
import 'package:TalkSpace/domain/model/enums/message_status_enum.dart';
import 'package:TalkSpace/domain/repository/message_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/messenger/message/chat_view_model.dart';
import 'package:TalkSpace/services/get_file_name.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:flutter/cupertino.dart';

class UploadFileViewModel extends ChangeNotifier {
  late MessageRepository _messageRepository;
  late ChatViewModel chatViewModel;

  update({
    required ChatViewModel chatViewModel,
    required MessageRepository messageRepository
  }) {
    this.chatViewModel = chatViewModel;
    _messageRepository = messageRepository;
  }

  _isolate({
    required MessageFile messageFile,
    required int chatId,
    required String text,
    required Message? message,
  }) async {
    Message? currentMessage;
    try {
      currentMessage = await _messageRepository.uploadFile(
        UploadFileMessageStreamRequest(
          text: text,
          chatId: chatId,
          messageFile: messageFile,
          messageId: message?.id ?? 0,
          callbackChunkUploaded: (MessageFile messageFile, double percentFileUploaded) {
            messageFile.uploadFileMessage!.percentUploadFile = percentFileUploaded;
            notifyListeners();
          },
        )
      );
      messageFile.uploadFileMessage!.status = FileUploadStatusEnum.uploaded;
      return currentMessage;
    } catch (e) {
      messageFile.uploadFileMessage!.status = FileUploadStatusEnum.error;
      messageFile.uploadFileMessage!.repeat = () => _isolate(
        messageFile: messageFile,
        text: text,
        chatId: chatId,
        message: currentMessage,
      );
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  create(Map<String, bool> selectedFiles, String text, int chatId) async {
    Message? uploadMessage;
    try {
      int messageId = int.parse(DateTime.now().microsecondsSinceEpoch.toString().substring(5, 13));

      List<MessageFile> messageFiles = [];
      messageFiles = selectedFiles.keys.map((String keyPath) {
        int messageFileId = int.parse(DateTime.now().microsecondsSinceEpoch.toString().substring(5, 13));

        File file = File(keyPath);
        return MessageFile(
          id: messageFileId,
          messageId: messageId,
          size: file.lengthSync(),
          fileName: getFileName(file),
          uploadFileMessage: UploadFileMessage(
            percentUploadFile: 0,
            status: FileUploadStatusEnum.uploading,
            file: file,
          ),
        );
      }).toList();

      uploadMessage = Message(
          id: messageId,
          text: text,
          messageFiles: messageFiles,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          status: MessageStatusEnum.uploading,
          user: User(
            email: jwtDecode().email,
            name: "",
            uuid: "",
          ),
          chatId: chatId,
          statusRead: false
      );

      Message? messageResponse;

      chatViewModel.addUploadMessage(uploadMessage);
      for (var messageFile in messageFiles) {
        messageResponse = await _isolate(
            messageFile: messageFile,
            text: text,
            chatId: chatId,
            message: messageResponse
        );
      }
      await chatViewModel.successUploadMessage(uploadMessage, messageResponse!);
    } catch (e) {
      if (uploadMessage != null) {
        chatViewModel.errorUploadMessage(uploadMessage);
      }
    }
  }
}