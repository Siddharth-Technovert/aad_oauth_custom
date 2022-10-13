import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import 'configs/adapters/cache_dto_adapters.dart';
import 'configs/adapters/hive_adapters.dart';
import 'configs/app_serializers.dart';
import 'configs/http_config.dart';
import 'device/background_service.dart';
import 'logger/logger_service.dart';
import 'utils/local_storage/cache/cache_manager_impl.dart';
import 'utils/local_storage/db/hive_db.dart';

class AppBootStrapper {
  static Future<void> initialize() async {
    try {
      await BackgroundService.initialize();
      LoggerService.init();
      HttpOverrides.global = MyHttpOverrides();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      AppSerializer.init();
      await CacheManagerImpl.init(
        registerAdapterAndOpen: (hive) => CacheDtoAdapters.call(hive),
      );
      await HiveDb.init(
        registerAdapterAndOpen: HiveAdapters.call(),
      );
    } catch (e) {
      log("Error : ${e.toString()}", error: e);
    }
  }
}
