import 'dart:developer';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
  'vm:entry-point',
) // Mandatory if the App is obfuscated or using Flutter 3.1+
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case BackgroundService.periodicTask:
        log("Executing task $taskName");
        //? here you can call api manager service to save data or do any other operation
        Fluttertoast.showToast(msg: "this method was called from native!");
        break;
      case Workmanager.iOSBackgroundTask:
        log("iOS background fetch delegate ran");
        break;
    }
    return Future.value(true);
  });
}

class BackgroundService {
  static const periodicTask = "backgroundTask";

  static Future initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
  }

  Future<void> registerPeriodicTask(
    String uniqueName,
    String taskName,
  ) async {
    if (Platform.isAndroid) {
      await Workmanager().registerPeriodicTask(
        uniqueName,
        taskName,
        frequency: const Duration(days: 1), // minimum 15 min
      );
    }
  }
}
