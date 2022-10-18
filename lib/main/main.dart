import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/app_bootstrapper.dart';
import '../core/configs/log/riverpod_observer_log.dart';
import '../domain/service_providers.dart';
import '../presentation/ui/app.dart';

abstract class Main {
  static Future<void> main() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await AppBootStrapper.initialize();
    _runAppInZone();
  }

  static Future<void> _runAppInZone() async {
    final container = ProviderContainer();
    final loggerService = container.read(loggerServiceProvider);
    runZonedGuarded(() {
      runApp(
        ProviderScope(
          observers: [
            RiverpodObserverLog(loggerService),
          ],
          child: const App(),
        ),
      );
    }, (ex, s) {
      loggerService.errorLog(ex, s);
      FirebaseCrashlytics.instance.recordError(ex, s, fatal: true);
    });
  }
}
