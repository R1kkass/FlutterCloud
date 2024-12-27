import 'package:hive/hive.dart';

class HiveBoxes {
  static Box<String> get chatFileUploaded {
    return Hive.box<String>("chatFileUploaded");
  }

  static Box<String> get token {
    return Hive.box<String>("token");
  }

  static Box<String> get secretKey {
    return Hive.box<String>("secretkey");
  }

  static Box<String> get cryptToken {
    return Hive.box<String>("cryptToken");
  }

  static Box<String> get listToken {
    return Hive.box<String>("listToken");
  }
}
