import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/device/connectivity_service.dart';
import '../core/logger/logger_service.dart';
import '../core/utils/api/api_manager/api_manager.dart';
import '../core/utils/api/api_manager/api_manager_impl.dart';
import '../core/utils/local_storage/cache/cache_manager.dart';
import '../core/utils/local_storage/cache/cache_manager_impl.dart';
import '../core/utils/local_storage/secure/secure_storage_manager.dart';
import '../core/utils/local_storage/secure/secure_storage_manager_impl.dart';
import 'data_source/local/user_local_data_source.dart';
import 'data_source/remote/news_remote_data_source.dart';
import 'data_source/remote/user_remote_data_source.dart';

part 'data_service_providers.g.dart';

///?Device Services Providers
@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) {
  return ConnectivityService();
}

@Riverpod(keepAlive: true)
LoggerService loggerService(LoggerServiceRef ref) {
  return LoggerService();
}

///?Data Source Providers
@Riverpod(keepAlive: true)
SecureStorageManager secureStorageManager(SecureStorageManagerRef ref) {
  return SecureStorageManagerImpl(ref.watch(loggerServiceProvider));
}

@Riverpod(keepAlive: true)
CacheManager cacheManager(CacheManagerRef ref) {
  return CacheManagerImpl(ref.watch(loggerServiceProvider));
}

@Riverpod(keepAlive: true)
ApiManager apiManager(ApiManagerRef ref) {
  return ApiManagerImpl(ref);
}

// ///?Local Data Source Providers

@Riverpod(keepAlive: true)
UserLocalDataSource userLocalDataSource(UserLocalDataSourceRef ref) {
  return UserLocalDataSource(
    ref.watch(secureStorageManagerProvider),
    ref.watch(cacheManagerProvider),
  );
}

///?Remote Data Source Providers

@Riverpod(keepAlive: true)
UserRemoteDataSource userRemoteDataSource(UserRemoteDataSourceRef ref) {
  return UserRemoteDataSource(ref.watch(apiManagerProvider));
}

@Riverpod(keepAlive: true)
NewsRemoteDataSource newsRemoteDataSource(NewsRemoteDataSourceRef ref) {
  return NewsRemoteDataSource(ref.watch(apiManagerProvider));
}
