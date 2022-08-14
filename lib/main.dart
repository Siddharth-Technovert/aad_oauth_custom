import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_bootstrapper.dart';
import 'core/configs/provider_log.dart';
import 'presentation/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootStrapper.initialize();
  _runAppInZone();
}

void _runAppInZone() {
  runZonedGuarded(() {
    runApp(
      ProviderScope(
        observers: [
          ProviderLog(),
        ],
        child: const App(),
      ),
    );
  }, (ex, s) {
    log("Error", error: ex, stackTrace: s);
  });
}
