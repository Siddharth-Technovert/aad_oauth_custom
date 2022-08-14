part of 'auth_usecases.dart';

final logoutUserUseCaseProvider = Provider(
  (ref) => LogoutUser(ref.read(authRepositoryProvider)),
);

class LogoutUser extends UseCase<void, AccountType> {
  final AuthRepository _authRepository;
  LogoutUser(this._authRepository);

  @override
  Future<void> call(AccountType accountType) async {
    await _authRepository.logout(accountType);
  }
}
