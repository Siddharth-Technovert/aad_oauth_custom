part of 'theme_storage_usecases.dart';

@Riverpod(keepAlive: true)
WriteTheme writeThemeUseCase(WriteThemeUseCaseRef ref) {
  return WriteTheme(ref.watch(secureStorageManagerProvider));
}

class WriteTheme extends UseCase<void, ThemeState> {
  final SecureStorageManager _secureStorageManager;
  WriteTheme(this._secureStorageManager);
  @override
  Future<void> call(ThemeState themeState) async {
    await _secureStorageManager.putAsync(
      key: AppConstants.themeKey,
      value: themeState.val,
    );
  }
}
