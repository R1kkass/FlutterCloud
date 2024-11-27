import 'package:hive/hive.dart';

class HiveBoxes {
  Box<String> get chatFileUploaded {
    return Hive.box<String>("chatFileUploaded");
  }

  Box<String> get token {
    return Hive.box<String>("token");
  }
}