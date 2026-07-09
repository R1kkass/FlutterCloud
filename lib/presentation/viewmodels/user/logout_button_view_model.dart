import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:flutter/foundation.dart';

class LogoutButtonViewModel extends ChangeNotifier {
  late AuthRepository _authRepository;
  late CommonToken commonToken;

  LogoutButtonViewModel({
    required AuthRepository authRepository
  }) {
    _authRepository = authRepository;
  }

  updateCommonToken(CommonToken commonToken) {
    this.commonToken = commonToken;
  }

  logout() async {
    await _authRepository.logoutFromCurrent();
    commonToken.setToken(null);
  }
}
