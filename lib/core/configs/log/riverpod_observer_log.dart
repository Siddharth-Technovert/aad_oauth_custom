import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../device/logger_service.dart';

class RiverpodObserverLog extends ProviderObserver {
  final LoggerService _loggerService;
  RiverpodObserverLog(this._loggerService);

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {}

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
//     log(
//       '''
// "provider": "${provider.name ?? provider.runtimeType}",
// "newValue": "$newValue"
//       ''',
//     );
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final errorMap = <String, String>{
      'error': error.toString(),
      'stackTrace': stackTrace.toString(),
    };
    _loggerService.logInfo(
      '''
Provider ${provider.name ?? provider.runtimeType} failed: ${errorMap.toString()}
      ''',
      className: "",
      methodName: "",
    );
    _loggerService.logException(error, stackTrace);
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {}
}
