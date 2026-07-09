import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/domain/model/entities/folder.dart';

class FindCloudResponse {
  List<File> files;
  List<Folder?> folders;

  FindCloudResponse({
    required this.files,
    required this.folders,
  });
}
