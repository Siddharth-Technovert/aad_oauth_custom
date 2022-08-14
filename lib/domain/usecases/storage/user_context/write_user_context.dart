part of 'user_context_usecases.dart';

final writeUserContextUseCaseProvider =
    Provider((ref) => WriteUserContext(ref.read(storageManagerProvider)));

class WriteUserContext extends UseCase<void, UserContext> {
  final StorageManager _storageManager;
  WriteUserContext(this._storageManager);
  @override
  Future<void> call(UserContext userContext) async {
    await _storageManager.writeAsync(
      key: AppConstants.userContextKey,
      value: userContext,
    );
  }
}
