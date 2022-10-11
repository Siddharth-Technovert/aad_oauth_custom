import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/device/connectivity_service.dart';
import '../../domain/enums/connectivity_status.dart';

//check for initial condition
final connectivityStatusProvider = StreamProvider<ConnectivityStatus>(
  (ref) => ConnectivityService().connectionStatusController.stream,
);
