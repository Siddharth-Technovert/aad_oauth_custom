import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../l10n/app_loc.dart';
import '../styles/colors/ui_custom_colors.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get appLoc => AppLoc.of(this);

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

  bool get isDarkMode =>
      Theme.of(this).colorScheme.brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  UICustomColors get customColors => theme.extension<UICustomColors>()!;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
}
