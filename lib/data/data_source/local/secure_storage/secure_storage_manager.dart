abstract class SecureStorageManager {
  Future<String?> getAsync({required String key});
  Future<bool> putAsync({
    required String key,
    required String value,
  });
  Future<void> deleteAsync({required String key});
  Future<void> clear();
}
