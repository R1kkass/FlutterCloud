import 'dart:io';

String getFileName(File file) {
  return file.path.split(Platform.pathSeparator).last;
}

String getFileExtension(File file) {
  return getFileName(file).split('.').last;
}
