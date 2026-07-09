class GetMessagesRequest {
  int chatId;
  int page;
  bool init;

  GetMessagesRequest({
    required this.chatId,
    required this.page,
    required this.init,
  });
}
