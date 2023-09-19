import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CancelTokenX on AutoDisposeRef {
  //?Cancel Token issue on dispose https://github.com/cfug/dio/issues/1953
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    // Timer? timer;
    // final link = keepAlive();
    // onDispose(() {
    //   cancelToken.cancel();
    //   // timer?.cancel();
    // });
    // onCancel(() {
    //   timer = Timer(const Duration(seconds: 5), () {
    //     link.close();
    //   });
    // });
    // onResume(() {
    //   timer?.cancel();
    // });
    return cancelToken;
  }
}
