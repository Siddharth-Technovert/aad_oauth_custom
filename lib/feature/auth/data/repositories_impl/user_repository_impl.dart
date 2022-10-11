import '../../../../core/utils/errors/app_exception.dart';
import '../../../../core/utils/errors/cache_exception.dart';
import '../../../../shared/data/models/result/data_state.dart';
import '../../../../shared/domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/user_remote_data_source.dart';

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
    final isTokenStored = await _userLocalDataSource.storeJwtToken(token);
    if (isTokenStored) {
      final userApiDtoResponse =
          await _userRemoteDataSource.createUser(accountType);
      return userApiDtoResponse.when(
        success: (data) {
          return _userLocalDataSource.createUser(data.toCacheDto());
        },
        error: (ex) => DataState.error(ex),
      );
    } else {
      return const DataState.error(
        AppException.cacheError(CacheException.insertError()),
      );
    }
  }

  @override
  Future<DataState<User>> readUser() async {
    return _userLocalDataSource.readUser();
  }

  @override
  Future<void> removeUser() async {
    _userLocalDataSource.removeUser();
  }

  @override
  Future<bool> updateUser(User user) {
    return _userLocalDataSource.updateUser();
  }
}
