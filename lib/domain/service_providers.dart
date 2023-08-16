import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/device/connectivity_service.dart';
import '../core/logger/logger_service.dart';
import '../core/utils/api/api_manager/api_manager.dart';
import '../core/utils/api/api_manager/api_manager_impl.dart';
import '../core/utils/local_storage/cache/cache_manager.dart';
import '../core/utils/local_storage/cache/cache_manager_impl.dart';
import '../core/utils/local_storage/secure/secure_storage_manager.dart';
import '../core/utils/local_storage/secure/secure_storage_manager_impl.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'repositories/user_repository.dart';

///device services provider
final connectivityServiceProvider = Provider((_) => ConnectivityService());
final loggerServiceProvider = Provider((_) => LoggerService());

///data source providers
final secureStorageManagerProvider = Provider<SecureStorageManager>(
  (ref) => SecureStorageManagerImpl(ref.watch(loggerServiceProvider)),
);
final cacheManagerProvider = Provider<CacheManager>(
  (ref) => CacheManagerImpl(ref.watch(loggerServiceProvider)),
);
final apiManagerProvider = Provider<ApiManager>((ref) {
  return ApiManagerImpl(ref);
});

///http repository providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    ref.watch(apiManagerProvider),
    ref.watch(secureStorageManagerProvider),
    ref.watch(cacheManagerProvider),
  );
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(userRepositoryProvider));
});
