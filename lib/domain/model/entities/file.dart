import 'package:TalkSpace/domain/model/entities/folder.dart';
import 'package:TalkSpace/domain/model/entities/media.dart';
import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/gen/dart/file/file.pb.dart' as filepb;

class File {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int folderId;
  int userId;
  Media media;
  Folder? folder;
  User user;

  File({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.folderId,
    required this.userId,
    required this.media,
    required this.folder,
    required this.user,
  });

  static File fromGrpc(filepb.File file) {
    return File(
        id: file.id,
        createdAt: DateTime.fromMillisecondsSinceEpoch(file.createdAt.seconds.toInt() * 1000),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(file.updatedAt.seconds.toInt() * 1000),
        folderId: file.folderId,
        userId: file.userId,
        media: Media.fromGrpc(file.media),
        folder: Folder.fromGrpc(file.folder),
        user: User.fromGRPC(file.user)
    );
  }

  static List<File> listFromGrpc(List<filepb.File> files) {
    return files.map((file) => fromGrpc(file)).toList();
  }
}
