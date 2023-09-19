import '../../mappers/cache_dto.dart';

abstract class CacheManager {
  Future<bool> hasData<HiveDto extends CacheDto>(
    String boxKey,
  );

  Future<bool> insertData<HiveDto extends CacheDto>(
    String boxKey,
    HiveDto data,
  );

  Future<bool> insertDataList<HiveDto extends CacheDto>(
    String boxKey,
    Iterable<HiveDto> values,
  );

  Future<HiveDto?> getData<HiveDto extends CacheDto>(
    String boxKey,
    String number,
  );

  Future<List<HiveDto>?> getAll<HiveDto extends CacheDto>(
    String boxKey,
  );

  Future<List<HiveDto>?> getPagedData<HiveDto extends CacheDto>(
    String boxKey, {
    required int page,
    required int limit,
  });

  Future<bool> updateData<HiveDto extends CacheDto>(
    String boxKey,
    HiveDto data,
  );

  // Future<List<HiveDto>?> getDataById<HiveDto extends CacheDto>(
  //   String boxKey, {
  //   required int id,
  // });

  Future<bool> deleteSingle<HiveDto extends CacheDto>(
    String boxKey,
    String number,
  );

  Future<bool> clearAll<HiveDto extends CacheDto>(
    String boxKey,
  );
}
