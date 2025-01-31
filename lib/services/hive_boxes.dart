import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static Box<String> get chatFileUploaded {
    return Hive.box<String>("chatFileUploaded");
  }

  static Box<String> get token {
    return Hive.box<String>("token");
  }

  static Box<Map<dynamic, dynamic>> get chatsSecretKey {
    return Hive.box<Map<dynamic, dynamic>>("chatsSecretKey");
  }

  static Box<String> get cryptToken {
    return Hive.box<String>("cryptToken");
  }

  static Box<String> get listToken {
    return Hive.box<String>("listToken");
  }

  static Box<BigInt> get pubKey {
    return Hive.box<BigInt>("pubKey");
  }

  static initHiveBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox<String>('token');
    await Hive.openBox<String>('listToken');
    await Hive.openBox<BigInt>('pubKey');
    await Hive.openBox<Map<dynamic, dynamic>>('chatsSecretKey');
    await Hive.openBox<String>('chatFileUploaded');
    await Hive.openBox<String>('cryptToken');
  }
}
