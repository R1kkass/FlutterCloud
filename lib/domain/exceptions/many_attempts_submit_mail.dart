class ManyAttemptsSubmitMail extends Error {
  String? message;

  ManyAttemptsSubmitMail({
    required this.message
  });
}
