import 'dart:io';
import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../mappers/api_dto.dart';
import '../../mappers/cache_dto.dart';
import '../../mappers/ui_model.dart';

class CacheManager {
  //TODO: call it in the app bootStrap
  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'hive_cache');
    if (await Directory(path).exists()) {
      await Directory(path).delete(recursive: true);
    }
    await Directory(path).create();
    Hive.init(path);

    //TODO: register adapter and open box here
    //? Hive.registerAdapter<ToDoHiveDto>(ToDoHiveDtoAdapter());
    //? await Hive.openBox<ToDoHiveDto>(ToDoHiveDto.boxKey);
  }

  Future<bool> hasData<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
  ) async {
    final box = Hive.box<HiveDto>(boxKey);
    return box.length > 0;
  }

  Future<bool> insertData<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
    HiveDto data,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      await box.put(data.number, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertDataList<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
    Iterable<HiveDto> values,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      final dataMap = {for (var data in values) data.number: data};
      await box.clear();
      await box.putAll(dataMap);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<HiveDto?> getData<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
    String number,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      return box.get(number);
    } catch (e) {
      return null;
    }
  }

  Future<List<HiveDto>?> getAll<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      final dataList = List.generate(box.length, (index) => box.getAt(index))
          .whereType<HiveDto>()
          .toList();
      return dataList;
    } catch (e) {
      return null;
    }
  }

  Future<List<HiveDto>?> getPagedData<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey, {
    required int page,
    required int limit,
  }) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      final totalData = box.length;

      final start = (page - 1) * limit;
      final newDataCount = min(totalData - start, limit);

      final pagedDataList = List.generate(
        newDataCount,
        (index) => box.getAt(start + index),
      ).whereType<HiveDto>().toList();

      return pagedDataList;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateData<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
    HiveDto data,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      await box.put(data.number, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSingle<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
    String number,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      await box.delete(number);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearAll<Model extends UICacheModel<HiveDto>,
      HiveDto extends CacheDto<Model, Dto>, Dto extends ApiCacheDto<HiveDto>>(
    String boxKey,
  ) async {
    try {
      final box = Hive.box<HiveDto>(boxKey);
      await box.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
