import 'package:TalkSpace/domain/model/entities/session.dart';
import 'package:TalkSpace/services/hive_boxes.dart' as hive_boxes;
import 'package:TalkSpace/services/jwt_decode.dart';

class SessionLocalDataSource {
  final _listToken = hive_boxes.HiveBoxes.listToken;

  Session? getCurrentSession() {
    return _listToken.get(jwtDecode().email)?.toEntity;
  }

  addSession(String email, Session session) async {
    await _listToken.put(email, hive_boxes.Session(sessionId: session.sessionId, refreshToken: session.refreshToken, email: email, passwordHash: session.passwordHash));
  }

  List<Session> getSavedSessions() {
    return _listToken.values.map((s) => Session(sessionId: s.sessionId, refreshToken: s.refreshToken, email: s.email, passwordHash: s.passwordHash)).toList();
  }
}
