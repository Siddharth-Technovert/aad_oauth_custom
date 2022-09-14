import '../../core/configs/constants/app_constants.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../core/utils/errors/cache_exception.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_source/api/api_manager/api_manager.dart';
import '../data_source/local/cache/cache_manager.dart';
import '../data_source/local/secure_storage/secure_storage_manager.dart';
import '../models/api/user/user_api_dto.dart';
import '../models/cache/user/user_cache_dto.dart';
import '../models/result/data_state.dart';

class UserRepositoryImpl implements UserRepository {
  // ignore: unused_field
  final ApiManager _apiManager;
  final SecureStorageManager _secureStorageManager;
  final CacheManager _cacheManager;

  UserRepositoryImpl(
    this._apiManager,
    this._secureStorageManager,
    this._cacheManager,
  );

  @override
  Future<DataState<User>> createUser(
    String token,
    AccountType accountType,
  ) async {
    final bool isTokenStored = await _secureStorageManager.putAsync(
      key: AppConstants.tokenKey,
      value: token,
    );
    if (isTokenStored) {
      const userApiDto = UserApiDto(
        id: "0",
        name: "Jon Snow",
        accountType: AccountType.guest,
      );
      final userCacheDto = userApiDto.toCacheDto();
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
    } else {
      return const DataState.error(
        AppException.cacheError(CacheException.insertError()),
      );
    }
  }

  @override
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

  @override
  Future<void> removeUser() async {
    await _cacheManager.clearAll<UserCacheDto>(UserCacheDto.boxKey);
    await _secureStorageManager.deleteAsync(
      key: AppConstants.tokenKey,
    );
  }

  @override
  Future<bool> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
