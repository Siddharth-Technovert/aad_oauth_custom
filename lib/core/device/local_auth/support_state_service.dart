import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class SupportStateService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> checkIfDeviceSupported() async {
    bool isSupported = false;
    await auth.isDeviceSupported().then((value) {
      return isSupported = value;
    });
    return isSupported;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException {
      availableBiometrics = <BiometricType>[];
    }

    return availableBiometrics;
  }
}
