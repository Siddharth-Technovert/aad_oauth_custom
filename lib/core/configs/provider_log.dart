import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLog extends ProviderObserver {
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
    log(
      '''
Provider ${provider.name ?? provider.runtimeType} failed: ${errorMap.toString()}
      ''',
    );
  }
}
