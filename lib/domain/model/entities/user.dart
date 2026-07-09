import 'package:TalkSpace/gen/dart/user/user.pb.dart' as chatpb;

class User {
  String uuid;
  String name;
  String email;

  User({
    required this.uuid,
    required this.name,
    required this.email,
  });

  static List<User> listFromGRPC(List<chatpb.User> users) {
    List<User> result = [];
    for (var user in users) {
      result.add(User(
        uuid: user.uuid,
        name: user.name,
        email: user.email,
      ));
    }

    return result;
  }

  static fromGRPC(chatpb.User user) {
    return User(
      uuid: user.uuid,
      name: user.name,
      email: user.email,
    );
  }
}