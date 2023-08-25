import '../../core/utils/api/response/api_response.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_source/local/user_local_data_source.dart';
import '../data_source/remote/user_remote_data_source.dart';
import '../models/api/user/user_api_dto.dart';
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
    final userResponse = await _userRemoteDataSource.createUser(accountType);
    switch (userResponse) {
      case ApiResponseSuccess<UserApiDto>(data: UserApiDto data):
        final tokenStatusState = await _userLocalDataSource.storeToken(token);
        switch (tokenStatusState) {
          case DataStateSuccess<bool>():
            return _userLocalDataSource.storeUser(data.toCacheDto());
          case DataStateError<bool>(ex: var ex):
            return DataStateError(ex);
        }
      case ApiResponseError<UserApiDto>(ex: AppException ex):
        return DataStateError(ex);
    }
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
