import 'dart:math';

String fileSize(int size) {
  if (size < 1024) {
    return "$size б";
  }
  if (size < 1024 * 10) {
    return "${(size / 1024).toStringAsFixed(2)} Кб";
  }
  var mb = 1024 * (pow(10, 5));
  if (size < mb) {
    return "${(size / mb).toStringAsFixed(2)} Мб";
  }
  return "${(size / mb).toStringAsFixed(2)} Гб";
}
