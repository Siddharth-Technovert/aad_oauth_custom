import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CancelTokenX on AutoDisposeRef {
  //?Cancel Token issue on dispose https://github.com/cfug/dio/issues/1953
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);

    return cancelToken;
  }

  KeepAliveLink cacheFor({Duration duration = const Duration(seconds: 2)}) {
    Timer? timer;
    final link = keepAlive();
    onDispose(() {
      // cancelToken.cancel();
      timer?.cancel();
    });
    onCancel(() {
      timer = Timer(duration, link.close);
    });
    onResume(() {
      timer?.cancel();
    });
    return link;
  }

  Future<void> debounce({Duration duration = const Duration(seconds: 2)}) {
    final completer = Completer<void>();
    final Timer timer = Timer(duration, () {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });
    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError("Cancelled"));
      }
    });
    return completer.future;
  }
}
