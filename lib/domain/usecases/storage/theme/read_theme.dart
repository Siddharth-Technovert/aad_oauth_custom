part of 'theme_storage_usecases.dart';

final readThemeUseCaseProvider = Provider(
  (ref) => ReadTheme(ref.watch(secureStorageManagerProvider)),
);

class ReadTheme extends NoParamsUseCase<ThemeState> {
  final SecureStorageManager _secureStorageManager;
  ReadTheme(this._secureStorageManager);
  @override
  Future<ThemeState> call() async {
    final themeString = await _secureStorageManager.getAsync(
      key: AppConstants.themeKey,
    );
    return themeString == 'light'
        ? const ThemeState.light()
        : themeString == 'dark'
            ? const ThemeState.dark()
            : const ThemeState.system();
  }
}
