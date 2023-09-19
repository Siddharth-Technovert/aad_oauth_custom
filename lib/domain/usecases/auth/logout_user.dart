part of 'auth_usecases.dart';

@Riverpod(keepAlive: true)
LogoutUser logoutUserUseCase(LogoutUserUseCaseRef ref) {
  return LogoutUser(ref.watch(authRepositoryProvider));
}

class LogoutUser extends UseCase<void, AccountType> {
  final AuthRepository _authRepository;
  LogoutUser(this._authRepository);

  @override
  Future<void> call(AccountType accountType) async {
    await _authRepository.logout(accountType);
  }
}
