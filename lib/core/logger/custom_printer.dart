import 'dart:developer';
import 'dart:io';

import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart';

class CustomLogPrinter extends LoggyPrinter {
  CustomLogPrinter()
      : file = File('log.txt'),
        super() {
    init();
  }

  Future<void> init() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }

    final path = "${directory!.path}/app_log";

    Directory(path).create();

    file = File("$path/log.txt");
    // final isExist = await file.exists();
    // if (isExist) {
    _sink = file.openWrite(
      mode: FileMode.writeOnly,
    );
    // }

    // file.create(recursive: true);
    // _sink = file.openWrite(
    //   mode: FileMode.writeOnly,
    // );
  }

  File file;
  IOSink? _sink;

  static final _levelPrefixes = {
    LogLevel.debug: '🐛 ',
    LogLevel.info: '👻 ',
    LogLevel.warning: '⚠️ ',
    LogLevel.error: '‼️ ',
  };
  static const _defaultPrefix = '🤔 ';

  @override
  void onLog(LogRecord record) {
    _sink?.writeln(record.toString());
    // if (kDebugMode) {
    final time = record.time.toIso8601String().split('T')[1];
    final callerFrame =
        record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';
    final logLevel =
        record.level.toString().replaceAll('Level.', '').toUpperCase();
    final prefix = _levelPrefixes[record.level] ?? _defaultPrefix;

    final msg = '$prefix$time $logLevel $callerFrame ${record.message}';
    switch (record.level) {
      case LogLevel.info:
        log('\x1B[34m$msg\x1B[0m');
        break;
      case LogLevel.debug:
        log('\x1B[32m$msg\x1B[0m');
        break;
      case LogLevel.error:
        log('\x1B[31m$msg\x1B[0m');
        break;
      case LogLevel.warning:
        log('\x1B[33m$msg\x1B[0m');
        break;
      default:
        log(msg);
        break;
    }

    if (record.stackTrace != null) {
      log(record.stackTrace.toString());
    }
    // } else {
    //   //TODO when in release mode do logging
    // }
  }
}
