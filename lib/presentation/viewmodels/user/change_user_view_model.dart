import 'package:TalkSpace/domain/model/entities/session.dart';
import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:flutter/foundation.dart';

class ChangeUserViewModel extends ChangeNotifier {
  CommonToken commonToken;
  late AuthRepository _authRepository;

  ChangeUserViewModel({
    required this.commonToken,
    required AuthRepository authRepository,
  }) {
    _authRepository = authRepository;
  }

  List<Session> sessions = [];

  changeUser(Session selectedSession) async {
    var token = await _authRepository.changeUser(selectedSession);
    commonToken.setToken(token);
  }

  getSessions() async {
    sessions = _authRepository.getSavedSessions();
    notifyListeners();
  }
}
