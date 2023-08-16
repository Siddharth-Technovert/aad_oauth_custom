import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  StreamController<bool> connectionStatusController = StreamController<bool>();

  void disposeStream() => connectionStatusController.close();

  ConnectivityService() {
    _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // await checkStatus();
      connectionStatusController.add(result != ConnectivityResult.none);
    });
  }

  Future<void> checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // await checkStatus();
      connectionStatusController.add(
        result != ConnectivityResult.none,
      );
    } on PlatformException {
      return;
    }
  }

  // Future<bool> checkStatus() async {
  //   bool isOnline = false;
  //   // if (connectivityResult != ConnectivityResult.none) {
  //   try {
  //     final result = await InternetAddress.lookup('example.com');
  //     isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  //   } on SocketException catch (_) {
  //     isOnline = false;
  //   }
  //   // }
  //   connectionStatusController.add(isOnline);
  //   return isOnline;
  // }
}
