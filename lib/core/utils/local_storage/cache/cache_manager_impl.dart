import 'dart:io';
import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../logger/logger_service.dart';
import '../../mappers/cache_dto.dart';
import 'cache_manager.dart';

typedef CacheMethod<T> = Future<bool> Function();

class CacheManagerImpl implements CacheManager {
  static final HiveInterface _hive = Hive;

  final LoggerService _loggerService;
  CacheManagerImpl(this._loggerService);

  //? call it in the app bootStrap
  static Future<void> init({
    required Future<void> Function(HiveInterface hive) registerAdapterAndOpen,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'cache_storage');
    if (!(await Directory(path).exists())) {
      // await Directory(path).delete(recursive: true);
      await Directory(path).create();
    }
    _hive.init(path);

    await registerAdapterAndOpen(_hive);
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
      _loggerService.errorLog(ex, s);
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
      _loggerService.errorLog(ex, s);
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
      _loggerService.errorLog(ex, s);
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
      _loggerService.errorLog(ex, s);
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
      _loggerService.errorLog(ex, s);
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

      // final val = await getData(boxKey, data.number)s;

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
      _loggerService.errorLog(ex, s);
      return false;
    }
  }
}
