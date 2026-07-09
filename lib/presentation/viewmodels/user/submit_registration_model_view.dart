import 'package:TalkSpace/domain/model/request/auth/index.dart';
import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_registration.dart';
import 'package:flutter/cupertino.dart';

class SubmitRegistrationModelView extends ChangeNotifier {
  late AuthRepository _authRepository;
  late CommonRegistration commonRegistration;

  SubmitRegistrationModelView({
    required AuthRepository authRepository,
  }) {
    _authRepository = authRepository;
  }

  updateCommonRegistration(CommonRegistration commonRegistration) {
    this.commonRegistration = commonRegistration;
  }

  Future registration(RegistrationRequest request) async {
    await _authRepository.registration(request);
    commonRegistration.password = request.password;
    commonRegistration.email = request.email;
    commonRegistration.notifyListeners();
    return null;
  }
}