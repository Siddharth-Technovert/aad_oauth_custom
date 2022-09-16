import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/states/core/theme/theme_state.dart';
import '../../../domain/usecases/storage/theme/theme_storage_usecases.dart';

final themeStateProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>((ref) {
  return ThemeStateNotifier(ref.read);
});

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeState get currentState => state;

  final Reader _read;
  late final ReadTheme _readThemeUseCase = _read(readThemeUseCaseProvider);
  late final WriteTheme _writeThemeUseCase = _read(writeThemeUseCaseProvider);

  ThemeStateNotifier(this._read) : super(const ThemeState.system()) {
    _init();
  }

  Future<void> _init() async {
    state = await _readThemeUseCase();
  }

  Future<void> setThemeState(ThemeState themeState) async {
    await _writeThemeUseCase(themeState);
    state = themeState;
  }
}
