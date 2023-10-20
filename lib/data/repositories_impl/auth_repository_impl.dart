import '../../core/utils/app_constants.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/result/data_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRepository _userRepository;
  AuthRepositoryImpl(this._userRepository);

  @override
  Future<DataState<User>> login(AccountType accountType) async {
    switch (accountType) {
      case AccountType.guest:
        return _userRepository.createUser(
          "local_token_123234324324587",
          accountType,
        );
      default:
        break;
    }
    return const DataStateError(
        AppExceptionUnknownError(AppConstants.unknownErrorText));
  }

  @override
  Future<void> logout(AccountType accountType) async {
    await _userRepository.removeUser();
    switch (accountType) {
      case AccountType.guest:
        break;
    }
  }
}
