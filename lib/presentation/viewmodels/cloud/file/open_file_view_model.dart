import 'package:TalkSpace/domain/model/entities/file.dart';
import 'package:TalkSpace/presentation/viewmodels/cloud/file/download_button_view_model.dart';
import 'package:TalkSpace/services/get_download_path.dart';

class OpenFileViewModel extends DownloadButtonViewModel {
  List<int> fileBytes = [];
  String path = "";
  bool loading = false;

  OpenFileViewModel({
    required super.fileRepository,
    required super.commonFileDownload,
  });

  openFile(File file) async {
    var downloadPath = await getDownloadPath();
    loading = true;
    await downloadFile(file, (data, decodedChunks) {
      if (decodedChunks.isDecoded) {
        fileBytes = decodedChunks.bytes;
        path = "$downloadPath/${data.fileName}";
        loading = false;
      }
    });
  }
}