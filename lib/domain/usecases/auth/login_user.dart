part of 'auth_usecases.dart';

@Riverpod(keepAlive: true)
LoginUser loginUserUseCase(LoginUserUseCaseRef ref) {
  return LoginUser(ref.watch(authRepositoryProvider));
}

class LoginUser extends UseCase<DataState<User>, AccountType> {
  final AuthRepository _authRepository;

  ///Login User Use Case
  LoginUser(this._authRepository);

  /// Callable class method
  @override
  Future<DataState<User>> call(AccountType accountType) async {
    return _authRepository.login(accountType);
  }
}
