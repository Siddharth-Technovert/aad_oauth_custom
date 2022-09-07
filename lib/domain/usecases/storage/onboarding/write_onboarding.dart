part of 'onboarding_usecases.dart';

final writeOnboardingUseCaseProvider =
    Provider((ref) => WriteOnboarding(ref.read(secureStorageManagerProvider)));

class WriteOnboarding extends UseCase<void, bool?> {
  final SecureStorageManager _secureStorageManager;
  WriteOnboarding(this._secureStorageManager);

  @override
  Future<void> call(bool? isOnboardingComplete) async {
    await _secureStorageManager.putAsync(
      key: AppConstants.isOnboardingDoneKey,
      value: isOnboardingComplete.toString(),
    );
  }
}
