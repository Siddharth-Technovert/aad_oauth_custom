import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void removeFocus() {
    final FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle get h1 => textTheme.headline1!;
  TextStyle get h2 => textTheme.headline2!;
  TextStyle get h3 => textTheme.headline3!;
  TextStyle get h4 => textTheme.headline4!;
  TextStyle get h5 => textTheme.headline5!;
  TextStyle get h6 => textTheme.headline6!;
  TextStyle get subtitle1 => textTheme.subtitle1!;
  TextStyle get subtitle2 => textTheme.subtitle2!;
  TextStyle get bodyText1 => textTheme.bodyText1!;
  TextStyle get bodyText2 => textTheme.bodyText2!;
  TextStyle get caption => textTheme.caption!;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
}
