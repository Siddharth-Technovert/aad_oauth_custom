import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/service_providers.dart';

//check for initial condition
final connectivityStatusProvider = StreamProvider<bool>(
  (ref) =>
      ref.watch(connectivityServiceProvider).connectionStatusController.stream,
  name: "ConnectivityStatus Provider",
);

//check for initial condition
final hasConnectivityProvider = StateProvider<bool>(
  (ref) => ref.watch(connectivityStatusProvider).value ?? false,
  name: "HasConnectivity Provider",
);

//check for initial condition
final landingScreenInternetConnectivityProvider =
    StateProvider.autoDispose<bool>(
  (ref) {
    final val = ref.read(hasConnectivityProvider);
    return val;
  },
);
