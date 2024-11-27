String fileSize(int size) {
  if (size < 900) {
    return "$size б";
  }
  if (size < 100000) {
    return "${(size / 1000).toStringAsFixed(2)} Кб";
  }
  if (size < 100000000) {
    return "${(size / 1000000).toStringAsFixed(2)} Мб";
  }
  return "${(size / 1000000000).toStringAsFixed(2)} Гб";
}
