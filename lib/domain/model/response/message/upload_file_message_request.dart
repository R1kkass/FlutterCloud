class UploadFileMessageRequest {
  String fileName;
  int messageId;
  int chatId;
  String text;

  UploadFileMessageRequest({
    required this.fileName,
    required this.chatId,
    required this.text,
    required this.messageId,
  });
}
