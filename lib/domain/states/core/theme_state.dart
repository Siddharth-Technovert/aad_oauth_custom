import 'package:flutter/material.dart';

@immutable
sealed class ThemeState {
  const ThemeState();
}

final class ThemeStateLight extends ThemeState {
  const ThemeStateLight();
}

final class ThemeStateDark extends ThemeState {
  const ThemeStateDark();
}

final class ThemeStateSystem extends ThemeState {
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
