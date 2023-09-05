import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/data_service_providers.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> connectivityStatus(ConnectivityStatusRef ref) {
  return ref
      .watch(connectivityServiceProvider)
      .connectionStatusController
      .stream;
}
