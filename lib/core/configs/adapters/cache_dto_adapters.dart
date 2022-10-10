import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/cache/user/user_cache_dto.dart';
import '../../../domain/service_providers.dart';
import '../../utils/local_storage/secure/secure_storage_manager.dart';
import '../../utils/local_storage/secure/secure_storage_manager_impl.dart';

class CacheDtoAdapters {
  static Future<void> call() async {
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
    Hive.registerAdapter<UserCacheDto>(UserCacheDtoAdapter());
    await Hive.openBox<UserCacheDto>(
      UserCacheDto.boxKey,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }
}