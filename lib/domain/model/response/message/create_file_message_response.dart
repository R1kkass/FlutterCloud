class CreateFileMessageResponse {
  int messageId;
  DateTime createdAt;
  DateTime updatedAt;

  CreateFileMessageResponse({
    required this.messageId,
    required this.createdAt,
    required this.updatedAt,
  });
}