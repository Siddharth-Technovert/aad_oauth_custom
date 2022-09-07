import 'package:flutter/services.dart';

class AppConfiguration {
  //TODO: Add your base url here
  static const baseUrl = "";

  static const EventChannel eventChannel =
      EventChannel('com.technovert.boilerplate/eventChannel');
  static const MethodChannel methodChannel =
      MethodChannel("com.technovert.boilerplate/methodChannel");
}
