import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../shared/domain/enums/connectivity_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();
  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

  static Future<bool> hasConnection() async {
    bool hasWifi = false;
    bool hasMobileConnection = false;
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      hasMobileConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      hasWifi = true;
    }
    return hasWifi || hasMobileConnection;
  }
}

// class NetworkManager {
//   NetworkManager();
//   static Future<bool> get isConnected async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result != null &&
//           result.isNotEmpty &&
//           result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       return false;
//     }
//   }
// }
