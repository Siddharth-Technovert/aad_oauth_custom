import 'package:flutter/services.dart';

import '../env/env.dart';

class AppConfiguration {
  static String baseUrl = Env.baseUrlKey;

  static const EventChannel eventChannel =
      EventChannel('com.technovert.boilerplate/eventChannel');
  static const MethodChannel methodChannel =
      MethodChannel("com.technovert.boilerplate/methodChannel");
}
