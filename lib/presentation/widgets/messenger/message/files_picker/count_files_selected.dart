import 'package:flutter/cupertino.dart';

class CountFilesSelected extends StatelessWidget {
  final int count;

  const CountFilesSelected({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10),
        height: count == 0 ? 0 : 30,
        child: Text(
          "Выбрано файлов: $count",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}