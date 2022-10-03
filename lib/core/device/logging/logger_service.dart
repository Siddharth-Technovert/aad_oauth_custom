import 'package:loggy/loggy.dart';

import 'custom_printer.dart';

class LoggerService {
  LoggerService() {
    // init();
  }

  static void init() {
    // FLog.applyConfigurations(
    //   LogsConfig()..formatType = FormatType.FORMAT_CSV,
    // );

    Loggy.initLoggy(
      logPrinter: CustomLogPrinter(),
      // logOptions: LogOptions(
      //   LogLevel.ALL,
      //   stackTraceLevel: LogLevel.ERROR,
      // ),
    );
  }

  void errorLog(dynamic e, StackTrace stackTrace) {
    // FLog.error(
    //   text: AppConstants.exception,
    //   exception: e,
    //   stacktrace: stackTrace,
    // );
    logError(e, stackTrace);
  }

  //TODO: check why it does not print in console
  void debugLog(String text, {String? className, String? methodName}) {
    // FLog.debug(className: className, methodName: methodName, text: text);
    logDebug(text);
  }

  void infoLog(String text, {String? className, String? methodName}) {
    // FLog.info(className: className, methodName: methodName, text: text);
    logInfo(text);
  }

  // void logSevere(String text, {String? className, String? methodName}) {
  //   // FLog.info(className: className, methodName: methodName, text: text);
  // }

  void warningLog(String text, {String? className, String? methodName}) {
    // FLog.warning(className: className, methodName: methodName, text: text);
    logWarning(text);
  }

  // Future<List<Log>> getAllLogs() async {
  //   final logs = await FLog.getAllLogs();
  //   return logs;
  // }

  // void deleteLogsByDate() {
  //   final filters = [
  //     Filter.lessThanOrEquals(
  //       DBConstants.FIELD_TIME_IN_MILLIS,
  //       DateTime.now().microsecondsSinceEpoch - (60000 * 60 * 24 * 5),
  //     )
  //   ];
  //   FLog.deleteAllLogsByFilter(filters: filters);
  // }

  // void clearLogs() {
  //   FLog.clearLogs();
  // }
}
