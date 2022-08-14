part of 'user_context_usecases.dart';

final readUserContextUseCaseProvider =
    Provider((ref) => ReadUserContext(ref.read(storageManagerProvider)));

class ReadUserContext extends NoParamsUseCase<UserContext?> {
  final StorageManager _storageManager;
  ReadUserContext(this._storageManager);
  @override
  Future<UserContext?> call() async {
    return _storageManager.readAsync<UserContext>(
      key: AppConstants.userContextKey,
    );
  }
}
