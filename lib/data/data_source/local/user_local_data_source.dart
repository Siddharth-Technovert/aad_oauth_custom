import '../../../core/utils/errors/app_exception.dart';
import '../../../core/utils/errors/cache_exception.dart';
import '../../../core/utils/local_storage/cache/cache_manager.dart';
import '../../../core/utils/local_storage/secure/secure_storage_manager.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../domain/models/user/user.dart';
import '../../models/cache/user/user_cache_dto.dart';
import '../../models/result/data_state.dart';

class UserLocalDataSource {
  final CacheManager _cacheManager;
  final SecureStorageManager _secureStorageManager;

  UserLocalDataSource(this._cacheManager, this._secureStorageManager);

  Future<bool> storeJwtToken(String token) async =>
      _secureStorageManager.putAsync(
        key: AppConstants.tokenKey,
        value: token,
      );

  Future<DataState<User>> createUser(UserCacheDto userCacheDto) async {
    final isUserAdded = await _cacheManager.insertData<UserCacheDto>(
      UserCacheDto.boxKey,
      userCacheDto,
    );
    if (isUserAdded) {
      return DataState.success(userCacheDto.toModel());
    } else {
      return const DataState.error(
        AppException.cacheError(CacheException.insertError()),
      );
    }
  }

  Future<DataState<User>> readUser() async {
    final usersCacheDto =
        await _cacheManager.getAll<UserCacheDto>(UserCacheDto.boxKey);
    return usersCacheDto == null || usersCacheDto.isEmpty
        ? const DataState.error(
            AppException.cacheError(CacheException.insertError()),
          )
        : DataState.success(
            usersCacheDto.first.toModel(),
          );
  }

  Future<bool> updateUser() async {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  Future<void> removeUser() async {
    await _cacheManager.clearAll<UserCacheDto>(UserCacheDto.boxKey);
    await _secureStorageManager.deleteAsync(
      key: AppConstants.tokenKey,
    );
  }
}
