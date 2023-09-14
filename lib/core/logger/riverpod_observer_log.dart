import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger_service.dart';

class RiverpodObserverLog extends ProviderObserver {
  final LoggerService _loggerService;
  RiverpodObserverLog(this._loggerService);

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    _loggerService.debugLog(
      "Created Provider: ${provider.name ?? provider.runtimeType}",
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _loggerService.debugLog(
      "Updated Provider: ${provider.name ?? provider.runtimeType}\nnewValue: $newValue",
    );
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    // final errorMap = <String, String>{
    //   'error': error.toString(),
    //   'stackTrace': stackTrace.toString(),
    // };
//     _loggerService.infoLog(
//       '''
// Provider ${provider.name ?? provider.runtimeType} failed: ${errorMap.toString()}
//       ''',
//       className: "",
//       methodName: "",
//     );
    _loggerService.errorLog(error, stackTrace);
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    _loggerService.debugLog(
      "Disposed Provider: ${provider.name ?? provider.runtimeType}",
    );
  }
}
