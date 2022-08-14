import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/configs/app_theme.dart';
import '../../../domain/states/core/theme/theme_state.dart';
import '../../../domain/usecases/storage/theme/theme_storage_usecases.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ref.watch(themeProvider).when(
        light: () => ThemeMode.light,
        dark: () => ThemeMode.dark,
        system: () => ThemeMode.system,
      );
});

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier(ref.read);
});

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeState get currentState => state;

  final Reader _read;
  late final ReadTheme _readThemeUseCase = _read(readThemeUseCaseProvider);
  late final WriteTheme _writeThemeUseCase = _read(writeThemeUseCaseProvider);

  ThemeNotifier(this._read) : super(const ThemeState.system()) {
    _init();
  }

  Future<void> _init() async {
    state = await _readThemeUseCase();
  }

  Future<void> setThemeState(ThemeState themeState) async {
    await _writeThemeUseCase(themeState);
    state = themeState;
  }

  ThemeData get lightThemeData => AppTheme.lightTheme;
  ThemeData get darkThemeData => AppTheme.darkTheme;
}
