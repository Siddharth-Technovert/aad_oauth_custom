part of 'user_usecases.dart';

final readUserUseCaseProvider = Provider(
  (ref) => ReadUser(ref.read(userRepositoryProvider)),
);

class ReadUser extends NoParamsUseCase<UserState> {
  final UserRepository _userRepository;
  ReadUser(this._userRepository);

  @override
  Future<UserState> call() async {
    return _userRepository.readUser();
  }
}
