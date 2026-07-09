import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/entities/user.dart';
import 'package:TalkSpace/gen/dart/file/file.pb.dart' as filepb;

class Folder {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int folderId;
  String nameFolder;
  List<File> files;
  Folder? folder;
  User user;

  Folder({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.folderId,
    required this.nameFolder,
    required this.files,
    required this.folder,
    required this.user,
  });

  static Folder? fromGrpc(filepb.Folder folder) {
    return Folder(
        id: folder.id,
        createdAt: DateTime.fromMillisecondsSinceEpoch(folder.createdAt.seconds.toInt() * 1000),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(folder.updatedAt.seconds.toInt() * 1000),
        folderId: folder.folderId,
        userId: folder.userId,
        nameFolder: folder.nameFolder,
        files: File.listFromGrpc(folder.files),
        folder: fromGrpc(folder.folder),
        user: User.fromGRPC(folder.user)
    );
  }

  static List<Folder?> listFromGrpc(List<filepb.Folder> folders) {
    return folders.map((folder) => fromGrpc(folder)).toList();
  }
}
