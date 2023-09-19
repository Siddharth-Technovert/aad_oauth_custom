import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/states/core/theme_state.dart';
import '../../../domain/usecases/storage/theme/theme_storage_usecases.dart';

part 'theme_state_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeStateNotifier extends _$ThemeStateNotifier {
  late final ReadTheme _readThemeUseCase = ref.watch(readThemeUseCaseProvider);
  late final WriteTheme _writeThemeUseCase =
      ref.watch(writeThemeUseCaseProvider);

  @override
  ThemeState build() {
    _init();
    return const ThemeStateSystem();
  }

  Future<void> _init() async {
    state = await _readThemeUseCase();
  }

  Future<void> setThemeState(ThemeState themeState) async {
    await _writeThemeUseCase(themeState);
    state = themeState;
  }
}
