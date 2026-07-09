class LoginResponse {
  String accessToken;
  String refreshToken;
  String sessionId;

  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.sessionId,
  });
}
