abstract class KeysRepository {
  Future<String> get downloadKeys;

  Future<Map<dynamic, dynamic>> getKeys();

  Future<String> uploadNewKeys();
}