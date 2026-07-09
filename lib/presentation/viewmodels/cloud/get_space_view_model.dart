import 'package:TalkSpace/domain/repository/file_repository.dart';
import 'package:TalkSpace/services/file_size.dart';
import 'package:flutter/material.dart';

class GetSpaceViewModel extends ChangeNotifier {
  late FileRepository _fileRepository;

  GetSpaceViewModel({
    required FileRepository fileRepository,
  }) {
    _fileRepository = fileRepository;
  }

  int space = 0;
  String text = "Загрузка...";

  void getSpace() async {
    try {
      space = await _fileRepository.getSpace();
      text = "Занято: ${fileSize(space)} из 1 Гб";
    } catch (e) {
      text = "Ошибка";
    }
  }
}