import 'dart:developer';
import 'dart:io';

import '../data/data_source/local/cache_manager.dart';
import '../data/data_source/local/db/hive_db.dart';
import 'configs/http_config.dart';
import 'device/background_service.dart';

class AppBootStrapper {
  static Future<void> initialize() async {
    try {
      HttpOverrides.global = MyHttpOverrides();
      await CacheManager.initialize();
      await HiveDb.initialize();
      await BackgroundService.initialize();
      await BackgroundService.registerPeriodicTask("2", myTask);
    } catch (e) {
      log("Error : ${e.toString()}", error: e);
    }
  }
}
