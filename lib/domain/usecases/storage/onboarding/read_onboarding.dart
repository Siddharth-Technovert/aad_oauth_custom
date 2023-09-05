part of 'onboarding_usecases.dart';

@Riverpod(keepAlive: true)
ReadOnboarding readOnboardingUseCase(ReadOnboardingUseCaseRef ref) {
  return ReadOnboarding(ref.watch(secureStorageManagerProvider));
}

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
