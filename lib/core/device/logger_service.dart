import 'package:f_logs/constants/db_constants.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:f_logs/model/flog/log.dart';
import 'package:f_logs/model/flog/log_level.dart';
import 'package:sembast/sembast.dart';

import '../configs/constants/app_constants.dart';

class LoggerService {
  void logException(Exception e, StackTrace stackTrace, LogLevel logLevel) {
    switch (logLevel) {
      case LogLevel.ERROR:
        FLog.error(
          text: AppConstants.exception,
          exception: e,
          stacktrace: stackTrace,
        );
        break;
      case LogLevel.INFO:
        FLog.info(
          text: AppConstants.exception,
          exception: e,
          stacktrace: stackTrace,
        );
        break;
      case LogLevel.FATAL:
        FLog.fatal(
          text: AppConstants.exception,
          exception: e,
          stacktrace: stackTrace,
        );
        break;
      case LogLevel.WARNING:
        FLog.warning(
          text: AppConstants.exception,
          exception: e,
          stacktrace: stackTrace,
        );
        break;
      case LogLevel.ALL:
      case LogLevel.TRACE:
      case LogLevel.DEBUG:
      case LogLevel.SEVERE:
      case LogLevel.OFF:
        FLog.logThis(
          type: logLevel,
          text: AppConstants.exception,
          exception: e,
          stacktrace: stackTrace,
        );
        break;
    }
  }

  void logDebug(String text, {String? className, String? methodName}) {
    FLog.debug(className: className, methodName: methodName, text: text);
  }

  void logInfo(String text, {String? className, String? methodName}) {
    FLog.info(className: className, methodName: methodName, text: text);
  }

  void logSevere(String text, {String? className, String? methodName}) {
    FLog.info(className: className, methodName: methodName, text: text);
  }

  void logWarning(String text, {String? className, String? methodName}) {
    FLog.warning(className: className, methodName: methodName, text: text);
  }

  Future<List<Log>> getAllLogs() async {
    final logs = await FLog.getAllLogs();
    return logs;
  }

  void deleteLogsByDate() {
    final filters = [
      Filter.lessThanOrEquals(
        DBConstants.FIELD_TIME_IN_MILLIS,
        DateTime.now().microsecondsSinceEpoch - (60000 * 60 * 24 * 5),
      )
    ];
    FLog.deleteAllLogsByFilter(filters: filters);
  }

  void clearLogs() {
    FLog.clearLogs();
  }
}
