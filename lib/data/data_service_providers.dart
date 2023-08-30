import 'package:flutter_riverpod/flutter_riverpod.dart';

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

///?Device Services Providers
final connectivityServiceProvider = Provider((_) => ConnectivityService());
final loggerServiceProvider = Provider((_) => LoggerService());

///?Data Source Providers
final secureStorageManagerProvider = Provider<SecureStorageManager>(
  (ref) => SecureStorageManagerImpl(ref.watch(loggerServiceProvider)),
);
final cacheManagerProvider = Provider<CacheManager>(
  (ref) => CacheManagerImpl(ref.watch(loggerServiceProvider)),
);
final apiManagerProvider = Provider<ApiManager>((ref) {
  return ApiManagerImpl(ref);
});

///?Local Data Source Providers
final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSource(
    ref.watch(secureStorageManagerProvider),
    ref.watch(cacheManagerProvider),
  );
});

///?Remote Data Source Providers
final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSource(ref.watch(apiManagerProvider));
});
final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSource(ref.watch(apiManagerProvider));
});
