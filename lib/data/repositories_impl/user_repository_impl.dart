import 'dart:convert';

import '../../core/configs/constants/app_constants.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/states/user/user_state.dart';
import '../data_source/api/api_manager/api_manager.dart';
import '../data_source/local/cache/cache_manager.dart';
import '../data_source/local/secure_storage/secure_storage_manager.dart';

class UserRepositoryImpl implements UserRepository {
  // ignore: unused_field
  final ApiManager _apiManager;
  final SecureStorageManager _secureStorageManager;
  // ignore: unused_field
  final CacheManager _cacheManager;

  UserRepositoryImpl(
    this._apiManager,
    this._secureStorageManager,
    this._cacheManager,
  );

  @override
  Future<UserState> createGuestUser(String name) async {
    final user = User(
      name: name,
      accountType: AccountType.guest,
    );
    final bool isUserStoredLocally = await _secureStorageManager.putAsync(
      key: AppConstants.userKey,
      value: jsonEncode(user.toJson()),
    );
    if (isUserStoredLocally) {
      return UserState.available(user);
    } else {
      return const UserState.notAvailable();
    }
  }

  @override
  Future<UserState> createUser(String token, AccountType accountType) async {
    final bool isTokenStored = await _secureStorageManager.putAsync(
      key: AppConstants.tokenKey,
      value: token,
    );
    if (isTokenStored) {
      final user = User(
        name: "any_name",
        accountType: accountType,
      );
      final bool isUserStoredLocally = await _secureStorageManager.putAsync(
        key: AppConstants.userKey,
        value: jsonEncode(user.toJson()),
      );
      if (isUserStoredLocally) {
        return UserState.available(user);
      } else {
        return const UserState.notAvailable();
      }
    } else {
      return const UserState.notAvailable();
    }
  }

  @override
  Future<UserState> readUser() async {
    final val = await _secureStorageManager.getAsync(
      key: AppConstants.userKey,
    );
    return val == null
        ? const UserState.notAvailable()
        : UserState.available(
            User.fromJson(jsonDecode(val) as Map<String, dynamic>),
          );
  }

  @override
  Future<void> removeUser() async {
    await _secureStorageManager.deleteAsync(
      key: AppConstants.userKey,
    );
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
