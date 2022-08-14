import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:workmanager/workmanager.dart';

const myTask = "backgroundTask";

Future<void> callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case myTask:
        log("Executing task $taskName");
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
  static Future initialize() async {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    registerPeriodicTask("2", myTask);
  }

  static Future<void> registerPeriodicTask(
    String uniqueName,
    String taskName,
  ) async {
    await Workmanager().registerPeriodicTask(
      uniqueName,
      taskName,
      frequency: const Duration(days: 1), // minimum 15 min
    );
  }
}
