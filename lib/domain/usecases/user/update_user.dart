part of 'user_usecases.dart';

final updateUserUseCaseProvider = Provider(
  (ref) => UpdateUser(ref.read(userRepositoryProvider)),
);

class UpdateUser extends UseCase<bool, User> {
  final UserRepository _userRepository;
  UpdateUser(this._userRepository);

  @override
  Future<bool> call(User user) async {
    return _userRepository.updateUser(user);
  }
}
