import 'dart:async';

import 'package:TalkSpace/domain/exceptions/many_attempts_submit_mail.dart';
import 'package:TalkSpace/domain/repository/auth_repository.dart';
import 'package:TalkSpace/domain/model/request/auth/index.dart' as authRequest;
import 'package:TalkSpace/domain/repository/keys_repository.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_registration.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:flutter/cupertino.dart';

class SubmitRegistrationMailButtonViewModel extends ChangeNotifier {
  late AuthRepository _authRepository;
  late CommonRegistration commonRegistration;
  late CommonToken commonToken;

  SubmitRegistrationMailButtonViewModel({
    required AuthRepository authRepository,
    required KeysRepository keysRepository,
  }) {
    _authRepository = authRepository;
  }

  updateCommonProperty({
    required CommonRegistration commonRegistration,
    required CommonToken commonToken,
  }) {
    this.commonRegistration = commonRegistration;
    this.commonToken = commonToken;
  }

  Future submit(String key) async {
    try {
      if (commonRegistration.email == null || commonRegistration.password == null) {
        throw Exception("Credentials is null");
      }

      var submitResponse = await _authRepository.submitEmail(authRequest.SubmitEmailRequest(
          email: commonRegistration.email!,
          password: commonRegistration.password!,
          key: key
      ));
      commonToken.setToken(submitResponse.accessToken);
    } on ManyAttemptsSubmitMail catch (e) {
      secondsBeforeNewRequest = 60 * 10;
      notifyListeners();
    }
  }

  var secondsBeforeNewRequest = 60;
  Timer? timer;

  updateCommonRegistration(CommonRegistration commonRegistration) {
    this.commonRegistration = commonRegistration;
  }

  void counterSeconds() {
    secondsBeforeNewRequest = secondsBeforeNewRequest <= 0 ? secondsBeforeNewRequest : 60;
    timer = Timer.periodic(const Duration(seconds: 1), (e) {
      if (secondsBeforeNewRequest > 0) {
        secondsBeforeNewRequest -= 1;
        notifyListeners();
      } else {
        timer!.cancel();
      }
    });
  }

  Future sendNewKey() async {
    await _authRepository.sendNewMailKeyResponse(commonRegistration.email!, commonRegistration.password!);
    counterSeconds();
  }
}
