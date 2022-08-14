part of 'user_context_usecases.dart';

final removeUserContextUseCaseProvider =
    Provider((ref) => RemoveUserContext(ref.read(storageManagerProvider)));

class RemoveUserContext extends NoParamsUseCase<void> {
  final StorageManager _storageManager;
  RemoveUserContext(this._storageManager);
  @override
  Future<void> call() async {
    await _storageManager.deleteAsync(
      key: AppConstants.userContextKey,
    );
  }
}
