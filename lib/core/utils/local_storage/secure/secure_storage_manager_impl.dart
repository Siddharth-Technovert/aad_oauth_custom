import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../logger/logger_service.dart';
import 'secure_storage_manager.dart';

class SecureStorageManagerImpl implements SecureStorageManager {
  static final HiveInterface _hive = Hive;

  final LoggerService _loggerService;

  SecureStorageManagerImpl(this._loggerService);

  //? call it in the app bootStrap
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'key_value_storage');
    if (!(await Directory(path).exists())) {
      // await Directory(path).delete(recursive: true);
      await Directory(path).create();
    }
    _hive.init(path);

    final encryptKey = await SecureStorageManagerImpl.getSecureKeyFromDevice(
      'secureStorageCacheKey',
    );

    final encryptionKey = base64Url.decode(encryptKey);
    await Hive.openBox<String>(
      'keyValueBox',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Future<String> getSecureKeyFromDevice(String key) async {
    const secureStorage = FlutterSecureStorage();
    String? encryptKey;
    try {
      encryptKey = await secureStorage.read(key: key);
    } catch (ex) {
      // Workaround for https://github.com/mogol/flutter_secure_storage/issues/43
      // await secureStorage.deleteAll();
      log(ex.toString());
    }
    if (encryptKey == null) {
      final value = base64UrlEncode(_hive.generateSecureKey());
      await secureStorage.write(
        key: key,
        value: value,
      );
      encryptKey = value;
    }
    return encryptKey;
  }

  @override
  Future<String?> getAsync({required String key}) async {
    try {
      final box = _hive.box<String>('keyValueBox');
      return box.get(key);
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
      final box = _hive.box<String>('keyValueBox');
      await box.put(key, value);
      return true;
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);
      return false;
    }
  }

  @override
  Future<bool> deleteAsync({required String key}) async {
    try {
      final box = _hive.box<String>('keyValueBox');
      await box.delete(key);
      return true;
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);
      return false;
    }
  }

  @override
  Future<bool> clear() async {
    try {
      final box = _hive.box<String>('keyValueBox');
      await box.clear();
      return true;
    } catch (ex, s) {
      _loggerService.errorLog(ex, s);
      return false;
    }
  }

  Future close() async {
    await _hive.close();
  }
}

// class SecureStorageManagerImpl implements SecureStorageManager {
//   late final FlutterSecureStorage _secureStorage;

//   final LoggerService _loggerService;

//   // final _androidOptions =
//   //     const AndroidOptions(encryptedSharedPreferences: true);

//   SecureStorageManagerImpl(this._loggerService) {
//     _secureStorage = const FlutterSecureStorage(
//         // aOptions: _androidOptions,
//         );
//   }

//   //TODO: update secure storage manager with hive (so in ios data will not persist when user uninstall)

//   // static Future<void> init({
//   //   required Future<void> Function(HiveInterface hive) registerAdapterAndOpen,
//   // }) async {
//   //   try {
//   //     final dir = await getApplicationDocumentsDirectory();
//   //     final String path = join(dir.path, 'hive_local_storage');
//   //     if (!(await Directory(path).exists())) {
//   //       // await Directory(path).delete(recursive: true);
//   //       await Directory(path).create();
//   //     }
//   //     _hive.init(path);
//   //     await registerAdapterAndOpen(_hive);
//   //   } catch (ex) {
//   //     // ProviderContainer().read(loggerServiceProvider).errorLog(ex, s);
//   //   }
//   // }

//   @override
//   Future<String?> getAsync({required String key}) async {
//     try {
//       return _secureStorage.read(
//         key: key,
//         // aOptions: _androidOptions,
//       );
//     } catch (ex, s) {
//       _loggerService.errorLog(ex, s);

//       return null;
//     }
//   }

//   @override
//   Future<bool> putAsync({
//     required String key,
//     required String value,
//   }) async {
//     try {
//       await _secureStorage.write(
//         key: key,
//         value: value,
//         // aOptions: _androidOptions,
//       );
//       return true;
//     } catch (ex, s) {
//       _loggerService.errorLog(ex, s);

//       return false;
//     }
//   }

//   @override
//   Future<void> deleteAsync({required String key}) async {
//     try {
//       await _secureStorage.delete(
//         key: key,
//         // aOptions: _androidOptions,
//       );
//     } catch (ex, s) {
//       _loggerService.errorLog(ex, s);
//     }
//   }

//   @override
//   Future<void> clear() async {
//     try {
//       await _secureStorage.deleteAll(
//           // aOptions: _androidOptions,
//           );
//     } catch (ex, s) {
//       _loggerService.errorLog(ex, s);
//     }
//   }
// }
