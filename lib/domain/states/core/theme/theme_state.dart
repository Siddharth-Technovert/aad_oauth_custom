import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();
  const factory ThemeState.light() = _Light;
  const factory ThemeState.dark() = _Dark;
  const factory ThemeState.system() = _System;

  String get val => when(
        light: () => 'light',
        dark: () => 'dark',
        system: () => 'system',
      );

  ThemeMode get mode => when(
        light: () => ThemeMode.light,
        dark: () => ThemeMode.dark,
        system: () => ThemeMode.system,
      );
}
