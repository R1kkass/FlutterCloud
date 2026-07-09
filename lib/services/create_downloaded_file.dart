import 'dart:io';
import 'dart:typed_data';

class CreateDownloadedFile {
  File createFile(Uint8List byte, String pathExist) {
    try {
      var fileExist = _notCreatedFileName(pathExist);
      fileExist.writeAsBytesSync(byte);
      return fileExist;
    } catch (e) {
      rethrow;
    }
  }
  
  File _notCreatedFileName(String pathExist) {
    var fileExist = File(pathExist);
    var countFile = 1;
    while (fileExist.existsSync()) {
      var nameFileArr = pathExist.split(".");
      if (nameFileArr.length > 1) {
        nameFileArr[nameFileArr.length - 2] =
            "${nameFileArr[nameFileArr.length - 2]} ($countFile)";
        fileExist = File(nameFileArr.join("."));
      } else {
        fileExist = File("$pathExist ($countFile)");
      }
      countFile++;
    }
    
    return fileExist;
  }
}
