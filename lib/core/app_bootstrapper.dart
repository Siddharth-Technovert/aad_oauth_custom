import 'dart:developer';
import 'dart:io';

import '../data/data_source/local/cache/cache_manager_impl.dart';
import '../data/data_source/local/db/hive_db.dart';
import 'configs/http_config.dart';
import 'device/background_service.dart';

class AppBootStrapper {
  static Future<void> initialize() async {
    try {
      await BackgroundService.initialize();
      HttpOverrides.global = MyHttpOverrides();
      await CacheManagerImpl.init();
      await HiveDb.initialize();
    } catch (e) {
      log("Error : ${e.toString()}", error: e);
    }
  }
}
