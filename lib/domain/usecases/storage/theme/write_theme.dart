part of 'theme_storage_usecases.dart';

final writeThemeUseCaseProvider = Provider(
  (ref) => WriteTheme(ref.read(storageManagerProvider)),
);

class WriteTheme extends UseCase<void, ThemeState> {
  final StorageManager _storageManager;
  WriteTheme(this._storageManager);
  @override
  Future<void> call(ThemeState themeState) async {
    await _storageManager.writeStringAsync(
      key: AppConstants.themeKey,
      value: themeState.val,
    );
  }
}
