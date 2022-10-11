part of 'onboarding_usecases.dart';

final readOnboardingUseCaseProvider = Provider(
  (ref) => ReadOnboarding(ref.read(secureStorageManagerProvider)),
);

class ReadOnboarding extends NoParamsUseCase<bool> {
  final SecureStorageManager _secureStorageManager;
  ReadOnboarding(this._secureStorageManager);
  @override
  Future<bool> call() async {
    final isOnboardingDone = await _secureStorageManager.getAsync(
      key: AppConstants.isOnboardingDoneKey,
    );

    return isOnboardingDone == "true" || false;
  }
}
