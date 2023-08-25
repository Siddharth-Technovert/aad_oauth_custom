import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/states/core/theme_state.dart';
import '../../../domain/usecases/storage/theme/theme_storage_usecases.dart';

final themeStateProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>((ref) {
  return ThemeStateNotifier(ref);
});

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  ThemeState get currentState => state;

  final Ref _ref;
  late final ReadTheme _readThemeUseCase = _ref.watch(readThemeUseCaseProvider);
  late final WriteTheme _writeThemeUseCase =
      _ref.watch(writeThemeUseCaseProvider);

  ThemeStateNotifier(this._ref) : super(const ThemeStateSystem()) {
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
