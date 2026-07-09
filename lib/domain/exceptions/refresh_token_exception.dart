class RefreshTokenException extends Error {
  int code;
  String? message;

  RefreshTokenException({
    required this.message,
    required this.code
  });
}
