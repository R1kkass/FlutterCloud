import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';

class CommonToken extends ChangeNotifier {
  late AuthRepository _authRepository;

  CommonToken({
    required AuthRepository authRepository,
  }) {
      _authRepository = authRepository;
  }

  String? _accessToken;
  String? get accessToken => _accessToken;

  refreshToken() async {
    _accessToken = await _authRepository.refresh();
    notifyListeners();
  }

  setToken(String? token) {
    _accessToken = token;
    notifyListeners();
  }
}
