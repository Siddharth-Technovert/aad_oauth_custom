import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/device/logger_service.dart';
import '../../../../domain/service_providers.dart';
import '../../../mappers/cache_dto.dart';
import '../../../models/cache/user/user_cache_dto.dart';
import '../secure_storage/secure_storage_manager.dart';
import '../secure_storage/secure_storage_manager_impl.dart';
import 'cache_manager.dart';

typedef CacheMethod<T> = Future<bool> Function();

class CacheManagerImpl implements CacheManager {
  static final HiveInterface _hive = Hive;

  final LoggerService _loggerService;
  CacheManagerImpl(this._loggerService);

  //? call it in the app bootStrap
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'cache_storage');
    if (!(await Directory(path).exists())) {
      // await Directory(path).delete(recursive: true);
      await Directory(path).create();
    }
    _hive.init(path);

    //Securing the box
    final SecureStorageManager secureStorageManager = SecureStorageManagerImpl(
      ProviderContainer().read(loggerServiceProvider),
    );
    String? encryptKey = await secureStorageManager.getAsync(key: 'encryptKey');
    if (encryptKey == null) {
      final key = base64UrlEncode(Hive.generateSecureKey());
      await secureStorageManager.putAsync(
        key: 'encryptKey',
        value: key,
      );
      encryptKey = key;
    }
    final encryptionKey = base64Url.decode(encryptKey);

    //TODO: register adapter and open box here
    // TODO: create snippet for this
    //? Register nested cache dto first so that no typeid error comes
    _hive.registerAdapter<UserCacheDto>(UserCacheDtoAdapter());
    await _hive.openBox<UserCacheDto>(
      UserCacheDto.boxKey,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  @override
  Future<bool> hasData<HiveDto extends CacheDto>(
    String boxKey,
  ) async {
    final box = _hive.box<HiveDto>(boxKey);
    return box.length > 0;
  }

  @override
  Future<bool> insertData<HiveDto extends CacheDto>(
    String boxKey,
    HiveDto data,
  ) async {
    try {
      final box = _hive.box<HiveDto>(boxKey);
      await box.put(data.number, data);
      return true;
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return false;
    }
  }

  @override
  Future<bool> insertDataList<HiveDto extends CacheDto>(
    String boxKey,
    Iterable<HiveDto> values,
  ) async {
    try {
      final box = _hive.box<HiveDto>(boxKey);
      final dataMap = {for (var data in values) data.number: data};
      await box.clear();
      await box.putAll(dataMap);
      return true;
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return false;
    }
  }

  @override
  Future<HiveDto?> getData<HiveDto extends CacheDto>(
    String boxKey,
    String number,
  ) async {
    try {
      final box = _hive.box<HiveDto>(boxKey);
      return box.get(number);
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    }
  }

  @override
  Future<List<HiveDto>?> getAll<HiveDto extends CacheDto>(
    String boxKey,
  ) async {
    try {
      final box = _hive.box<HiveDto>(boxKey);
      final dataList = List.generate(box.length, (index) => box.getAt(index))
          .whereType<HiveDto>()
          .toList();
      return dataList;
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    }
  }

  @override
  Future<List<HiveDto>?> getPagedData<HiveDto extends CacheDto>(
    String boxKey, {
    required int page,
    required int limit,
  }) async {
    try {
      final box = _hive.box<HiveDto>(boxKey);
      final totalData = box.length;

      final start = (page - 1) * limit;
      final newDataCount = min(totalData - start, limit);

      final pagedDataList = List.generate(
        newDataCount,
        (index) => box.getAt(start + index),
      ).whereType<HiveDto>().toList();

      return pagedDataList;
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    }
  }

  @override
  Future<bool> updateData<HiveDto extends CacheDto>(
    String boxKey,
    HiveDto data,
  ) async {
    return _tryCacheRequest<HiveDto>(() async {
      final box = _hive.box<HiveDto>(boxKey);
      await box.put(data.number, data);
      return true;
    });
  }

  @override
  Future<bool> deleteSingle<HiveDto extends CacheDto>(
    String boxKey,
    String number,
  ) async {
    return _tryCacheRequest<HiveDto>(() async {
      final box = _hive.box<HiveDto>(boxKey);
      await box.delete(number);
      return true;
    });
  }

  @override
  Future<bool> clearAll<HiveDto extends CacheDto>(
    String boxKey,
  ) async {
    return _tryCacheRequest<HiveDto>(() async {
      final box = _hive.box<HiveDto>(boxKey);
      await box.clear();
      return true;
    });
  }

  Future<bool> _tryCacheRequest<T extends CacheDto>(
    CacheMethod<T> executeMethod,
  ) async {
    try {
      return await executeMethod();
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return false;
    }
  }
}
