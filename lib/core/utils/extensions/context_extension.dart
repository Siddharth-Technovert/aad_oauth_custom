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
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double screenHeightPercentage(int percentage) =>
      (MediaQuery.of(this).size.height / 100) * percentage;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  TextStyle get h1 => textTheme.displayLarge!;
  TextStyle get h2 => textTheme.displayMedium!;
  TextStyle get h3 => textTheme.displaySmall!;
  TextStyle get h4 => textTheme.headlineMedium!;
  TextStyle get h5 => textTheme.headlineSmall!;
  TextStyle get h6 => textTheme.titleLarge!;
  TextStyle get subtitle1 => textTheme.titleMedium!;
  TextStyle get subtitle2 => textTheme.titleSmall!;
  TextStyle get bodyText1 => textTheme.bodyLarge!;
  TextStyle get bodyText2 => textTheme.bodyMedium!;
  TextStyle get caption => textTheme.bodySmall!;

  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
}
