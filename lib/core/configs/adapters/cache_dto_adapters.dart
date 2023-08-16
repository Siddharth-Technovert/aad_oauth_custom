import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/cache/user/user_cache_dto.dart';
import '../../utils/local_storage/secure/secure_storage_manager_impl.dart';

class CacheDtoAdapters {
  static Future<void> call(HiveInterface hive) async {
    //Securing the box

    final encryptKey = await SecureStorageManagerImpl.getSecureKeyFromDevice(
      'hiveCacheKey',
    );
    final encryptionKey = base64Url.decode(encryptKey);

    //TODO: register adapter and open box here
    // TODO: create snippet for this
    //? Register nested cache dto first so that no typeid error comes
    hive.registerAdapter<UserCacheDto>(UserCacheDtoAdapter());
    await hive.openBox<UserCacheDto>(
      UserCacheDto.boxKey,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }
}
