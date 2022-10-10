import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../logger/logger_service.dart';
import 'secure_storage_manager.dart';

class SecureStorageManagerImpl implements SecureStorageManager {
  late final FlutterSecureStorage _secureStorage;

  final LoggerService _loggerService;

  // final _androidOptions =
  //     const AndroidOptions(encryptedSharedPreferences: true);

  SecureStorageManagerImpl(this._loggerService) {
    _secureStorage = const FlutterSecureStorage(
        // aOptions: _androidOptions,
        );
  }

  @override
  Future<String?> getAsync({required String key}) async {
    try {
      return _secureStorage.read(
        key: key,
        // aOptions: _androidOptions,
      );
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);

      return null;
    }
  }

  @override
  Future<bool> putAsync({
    required String key,
    required String value,
  }) async {
    try {
      await _secureStorage.write(
        key: key,
        value: value,
        // aOptions: _androidOptions,
      );
      return true;
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);

      return false;
    }
  }

  @override
  Future<void> deleteAsync({required String key}) async {
    try {
      await _secureStorage.delete(
        key: key,
        // aOptions: _androidOptions,
      );
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll(
          // aOptions: _androidOptions,
          );
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);
    }
  }
}
