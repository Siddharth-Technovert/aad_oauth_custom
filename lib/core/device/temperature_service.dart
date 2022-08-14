import '../configs/app_configuration.dart';

class TemperatureService {
  static Stream<dynamic>? _temperatureStream;

  static Future initialize() async {
    final dynamic val =
        await AppConfiguration.methodChannel.invokeMethod("initializeSensor");

    _temperatureStream = AppConfiguration.eventChannel
        .receiveBroadcastStream()
        .map<dynamic>((value) => value);

    return val;
  }

  static Stream<dynamic>? get temperatureStream {
    return _temperatureStream;
  }
}
