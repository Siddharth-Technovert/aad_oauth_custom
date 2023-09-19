import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CancelTokenX on AutoDisposeRef {
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
