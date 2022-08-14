import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/configs/app_serializers.dart';

class StorageManager {
  late final FlutterSecureStorage _secureStorage;

  StorageManager() {
    _secureStorage = const FlutterSecureStorage();
  }

  Future<void> deleteAllAsync() async {
    await _secureStorage.deleteAll();
  }

  Future<void> deleteAsync({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<String?> readStringAsync({required String key}) async {
    final value = await _secureStorage.read(key: key);
    return value;
  }

  Future<T?> readAsync<T>({
    required String key,
  }) async {
    String? data;
    try {
      data = await _secureStorage.read(key: key);
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
    if (data == null) return null;
    if (AppSerializers.serializers[T] != null) {
      return AppSerializers
          .serializers[T]!(jsonDecode(data) as Map<String, dynamic>) as T;
    } else {
      return null;
    }
  }

  Future<void> writeAsync({
    required String key,
    required dynamic value,
  }) async {
    String? data;
    try {
      // ignore: avoid_dynamic_calls
      data = jsonEncode(value!.toJson());
      if (kDebugMode) {
        print(data);
      }
    } catch (ex) {
      data = jsonEncode(value);
      if (kDebugMode) {
        print(ex);
      }
    }
    await _secureStorage.write(key: key, value: data);
  }

  Future<void> writeStringAsync({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }
}
