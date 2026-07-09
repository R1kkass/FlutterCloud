import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:flutter/foundation.dart';

class SubmitLoginViewModel extends ChangeNotifier {
  late AuthRepository _authRepository;
  late CommonToken commonToken;

  SubmitLoginViewModel({
    required AuthRepository authRepository,
  }) {
    _authRepository = authRepository;
  }

  updateCommonToken(CommonToken commonToken) {
    this.commonToken = commonToken;
  }

  Future login(LoginRequest request) async {
    var response = await _authRepository.login(request);
    commonToken.setToken(response.accessToken);
  }
}
