import '../../../core/utils/app_constants.dart';
import '../../../core/utils/errors/app_exception.dart';
import '../../../core/utils/errors/cache_exception.dart';
import '../../../core/utils/local_storage/cache/cache_manager.dart';
import '../../../core/utils/local_storage/secure/secure_storage_manager.dart';
import '../../../domain/models/user/user.dart';
import '../../models/cache/user/user_cache_dto.dart';
import '../../models/result/data_state.dart';

class UserLocalDataSource {
  final SecureStorageManager _secureStorageManager;
  final CacheManager _cacheManager;

  const UserLocalDataSource(
    this._secureStorageManager,
    this._cacheManager,
  );

  Future<DataState<bool>> storeToken(String token) async {
    final isTokenStored = await _secureStorageManager.putAsync(
      key: AppConstants.tokenKey,
      value: token,
    );
    if (isTokenStored) {
      return const DataStateSuccess(true);
    } else {
      return const DataStateError(
        AppExceptionCacheError(CacheExceptionInsertError()),
      );
    }
  }

  Future<DataState<User>> storeUser(UserCacheDto userCacheDto) async {
    final userCacheDtoResponse = await _cacheManager.insertData<UserCacheDto>(
      UserCacheDto.boxKey,
      userCacheDto,
    );
    if (userCacheDtoResponse) {
      return DataStateSuccess(userCacheDto.toModel());
    } else {
      return const DataStateError(
        AppExceptionCacheError(CacheExceptionInsertError()),
      );
    }
  }

  Future<DataState<User>> getUser() async {
    final usersCacheDto =
        await _cacheManager.getAll<UserCacheDto>(UserCacheDto.boxKey);
    return usersCacheDto == null || usersCacheDto.isEmpty
        ? const DataStateError(
            AppExceptionCacheError(CacheExceptionFetchError()),
          )
        : DataStateSuccess(
            usersCacheDto.first.toModel(),
          );
  }

  Future<void> removeUser() async {
    await _cacheManager.clearAll<UserCacheDto>(UserCacheDto.boxKey);
    await _secureStorageManager.deleteAsync(
      key: AppConstants.tokenKey,
    );
  }
}
