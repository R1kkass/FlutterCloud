import 'package:TalkSpace/domain/exceptions/refresh_token_exception.dart';
import 'package:TalkSpace/presentation/viewmodels/user/common_token.dart';
import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  late CommonToken commonToken;

  bool isError = false;

  refreshToken() async {
    try {
      isError = false;
      notifyListeners();
      await commonToken.refreshToken();
    } on RefreshTokenException catch (e) {
      commonToken.setToken(null);
      rethrow;
    } catch (e) {
      isError = true;
      notifyListeners();
      rethrow;
    }
  }

  updateCommonToken(CommonToken common) {
    commonToken = common;
    notifyListeners();
  }
}
