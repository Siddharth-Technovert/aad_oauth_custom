import 'package:flutter/material.dart';

sealed class ThemeState {}

class ThemeStateLight implements ThemeState {
  const ThemeStateLight();
}

class ThemeStateDark implements ThemeState {
  const ThemeStateDark();
}

class ThemeStateSystem implements ThemeState {
  const ThemeStateSystem();
}

extension ThemeStateExtension on ThemeState {
  String get val => switch (this) {
        ThemeStateLight() => "light",
        ThemeStateDark() => "dark",
        ThemeStateSystem() => "system",
      };

  ThemeMode get mode => switch (this) {
        ThemeStateLight() => ThemeMode.light,
        ThemeStateDark() => ThemeMode.dark,
        ThemeStateSystem() => ThemeMode.system,
      };
}
