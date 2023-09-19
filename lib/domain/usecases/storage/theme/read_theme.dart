part of 'theme_storage_usecases.dart';

@Riverpod(keepAlive: true)
ReadTheme readThemeUseCase(ReadThemeUseCaseRef ref) {
  return ReadTheme(ref.watch(secureStorageManagerProvider));
}

class ReadTheme extends NoParamsUseCase<ThemeState> {
  final SecureStorageManager _secureStorageManager;
  ReadTheme(this._secureStorageManager);
  @override
  Future<ThemeState> call() async {
    final themeString = await _secureStorageManager.getAsync(
      key: AppConstants.themeKey,
    );
    return themeString == 'light'
        ? const ThemeStateLight()
        : themeString == 'dark'
            ? const ThemeStateDark()
            : const ThemeStateSystem();
  }
}
