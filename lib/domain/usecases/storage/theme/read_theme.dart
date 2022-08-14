part of 'theme_storage_usecases.dart';

final readThemeUseCaseProvider = Provider(
  (ref) => ReadTheme(ref.read(storageManagerProvider)),
);

class ReadTheme extends NoParamsUseCase<ThemeState> {
  final StorageManager _storageManager;
  ReadTheme(this._storageManager);
  @override
  Future<ThemeState> call() async {
    final themeString = await _storageManager.readStringAsync(
      key: AppConstants.themeKey,
    );
    return themeString == 'light'
        ? const ThemeState.light()
        : themeString == 'dark'
            ? const ThemeState.dark()
            : const ThemeState.system();
  }
}
