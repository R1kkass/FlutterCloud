class Session {
  String sessionId;
  String refreshToken;
  String email;
  String passwordHash;

  Session({
    required this.sessionId,
    required this.refreshToken,
    required this.email,
    required this.passwordHash,
  });
}
