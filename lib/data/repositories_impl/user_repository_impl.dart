import '../../domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../models/result/data_state.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepositoryImpl(
    this._userRemoteDataSource,
    this._userLocalDataSource,
  );

  @override
  Future<DataState<User>> createUser(
    String token,
    AccountType accountType,
  ) async {
    return (await _userRemoteDataSource.createUser(accountType)).when(
      success: (data, _) async {
        final tokenStatusState = await _userLocalDataSource.storeToken(token);
        return tokenStatusState.when(
            success: (_) async {
              return _userLocalDataSource.storeUser(data.toCacheDto());
            },
            error: (ex) => DataState.error(ex));
      },
      error: (ex) => DataState.error(ex),
    );
  }

  @override
  Future<DataState<User>> readUser() async {
    return _userLocalDataSource.getUser();
  }

  @override
  Future<void> removeUser() async {
    return _userLocalDataSource.removeUser();
  }

  @override
  Future<bool> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
