import 'package:flutter/widgets.dart';

abstract class AppConstants {
  //screen key
  static const Key homeScreenKey = Key("homeScreenKey");

  ///Theme Type
  static const String darkTheme = "dark";
  static const String lightTheme = "light";
  static const String systemDefault = "systemDefault";

  ///Secure storage keys
  static const String userContextKey = "userContext";
  static const String themeKey = "theme";
  static const String tokenKey = "token";

  ///Hive Adapter Ids
  //?TODO: Add Hive Adapter Ids
  // static const int userHiveAdapterId = 0;

  ///Hive Box Keys
  //?TODO: Add Box Keys
  // static const String userBoxKey = "userBox";

  ///Error Messages
  static const String exception = "exception";
}
