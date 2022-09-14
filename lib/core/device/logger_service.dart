import 'package:f_logs/f_logs.dart';
import 'package:sembast/sembast.dart';

import '../configs/constants/app_constants.dart';

class LoggerService {
  LoggerService() {
    FLog.applyConfigurations(
      LogsConfig()..formatType = FormatType.FORMAT_CSV,
    );
  }

  void logException(dynamic e, StackTrace stackTrace) {
    FLog.error(
      text: AppConstants.exception,
      exception: e,
      stacktrace: stackTrace,
    );
  }

  //TODO: check why it does not print in console
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
