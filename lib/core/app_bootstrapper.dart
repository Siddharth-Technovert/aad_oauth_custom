import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../data/data_source/local/cache/cache_manager_impl.dart';
import '../data/data_source/local/db/hive_db.dart';
import '../firebase_options.dart';
import 'configs/http_config.dart';
import 'device/background_service.dart';
import 'device/logging/logger_service.dart';

class AppBootStrapper {
  static Future<void> initialize() async {
    try {
      await BackgroundService.initialize();
      LoggerService.init();
      HttpOverrides.global = MyHttpOverrides();
      await CacheManagerImpl.init();
      await HiveDb.initialize();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    } catch (e) {
      log("Error : ${e.toString()}", error: e);
    }
  }
}
