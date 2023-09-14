import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

import 'custom_printer.dart';

class LoggerService {
  LoggerService();

  static void init() {
    if (kDebugMode) {
      Loggy.initLoggy(
        logPrinter: CustomLogPrinter(),
        // logOptions: LogOptions(
        //   LogLevel.ALL,
        //   stackTraceLevel: LogLevel.ERROR,
        // ),
      );
    }
  }

  Future errorLog(dynamic e, StackTrace stackTrace) async {
    if (kDebugMode) {
      logError(e, stackTrace);
    } else {}
  }

  Future dioExceptionLog(
      String endpoint, dynamic e, StackTrace stackTrace) async {
    if (kDebugMode) {
      logError(e, stackTrace);
    } else {}
  }

  Future serializationErrorLog<T>(String endpoint) async {
    if (kDebugMode) {
      logError("Serialization Failed of ${T.runtimeType}");
    } else {}
  }

  void debugLog(String text, {String? className, String? methodName}) {
    if (kDebugMode) {
      logDebug(text);
    }
  }

  void infoLog(String text, {String? className, String? methodName}) {
    if (kDebugMode) {
      logInfo(text);
    }
  }

  void warningLog(String text, {String? className, String? methodName}) {
    if (kDebugMode) {
      logWarning(text);
    }
  }
}
