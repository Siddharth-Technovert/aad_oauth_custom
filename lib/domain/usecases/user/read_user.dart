part of 'user_usecases.dart';

@Riverpod(keepAlive: true)
ReadUser readUserUseCase(ReadUserUseCaseRef ref) {
  return ReadUser(ref.watch(userRepositoryProvider));
}

class ReadUser extends NoParamsUseCase<DataState<User>> {
  final UserRepository _userRepository;
  ReadUser(this._userRepository);

  @override
  Future<DataState<User>> call() async {
    return _userRepository.readUser();
  }
}
