import 'package:flutter/material.dart';

import 'ui_custom_colors.dart';

abstract interface class UIColors {
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get outline;
  Color get outlineVariant;
  Color get shadow;
  Color get scrim;
  Color get inverseSurface;
  Color get onInverseSurface;
  Color get inversePrimary;
  Color get surfaceTint;

  ///Custom Colors
  UICustomColors get customColors;
}
