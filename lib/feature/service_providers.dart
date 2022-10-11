import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/device/background_service.dart';
import '../core/device/connectivity_service.dart';
import '../core/device/deeplink_service.dart';
import '../core/device/file_picker_service.dart';
import '../core/device/local_auth/local_auth_service.dart';
import '../core/device/local_auth/support_state_service.dart';
import '../core/device/local_notification_service.dart';
import '../core/device/permission_service.dart';
import '../core/logger/logger_service.dart';
import '../core/utils/api/api_manager/api_manager.dart';
import '../core/utils/api/api_manager/api_manager_impl.dart';
import '../core/utils/local_storage/cache/cache_manager.dart';
import '../core/utils/local_storage/cache/cache_manager_impl.dart';
import '../core/utils/local_storage/db/hive_db.dart';
import '../core/utils/local_storage/db/sqlite_db.dart';
import '../core/utils/local_storage/secure/secure_storage_manager.dart';
import '../core/utils/local_storage/secure/secure_storage_manager_impl.dart';
import '../shared/data/data_source/api_cache_client.dart';
import 'auth/data/data_source/local/user_local_data_source.dart';
import 'auth/data/data_source/remote/user_remote_data_source.dart';
import 'auth/data/repositories_impl/auth_repository_impl.dart';
import 'auth/data/repositories_impl/user_repository_impl.dart';
import 'auth/domain/repositories/auth_repository.dart';
import 'auth/domain/repositories/user_repository.dart';
import 'home/api_client.dart';

///device services provider
final backgroundServiceProvider = Provider((_) => BackgroundService());
final connectivityServiceProvider = Provider((_) => ConnectivityService());
final deepLinkServiceProvider = Provider((_) => DeepLinkService());
final loggerServiceProvider = Provider((_) => LoggerService());
final notificationServiceProvider = Provider((_) => NotificationService());
final localAuthServiceProvider = Provider((_) => LocalAuthService());
final supportStateServiceProvider = Provider((_) => SupportStateService());
final permissionServiceProvider = Provider((_) => PermissionService());
final filePickerServiceProvider = Provider(
  (ref) => FilePickerService(
    ref.read(permissionServiceProvider),
  ),
);

///storage providers

final hiveDbProvider =
    Provider((ref) => HiveDb(ref.read(loggerServiceProvider)));
final sqlDbProvider =
    Provider((ref) => SQLiteDb(ref.read(loggerServiceProvider)));

///data source providers
final secureStorageManagerProvider = Provider<SecureStorageManager>(
  (ref) => SecureStorageManagerImpl(ref.read(loggerServiceProvider)),
);
final cacheManagerProvider = Provider<CacheManager>(
  (ref) => CacheManagerImpl(ref.read(loggerServiceProvider)),
);
final apiManagerProvider = Provider<ApiManager>((ref) {
  return ApiManagerImpl(
    ref.read(secureStorageManagerProvider),
    // ref.read(loggerServiceProvider),
  );
});
final apiClientProvider = Provider((ref) {
  return ApiClient(
    ref.read(apiManagerProvider),
  );
});
final apiCacheClientProvider = Provider((ref) {
  return ApiCacheClient(
    ref.read(apiManagerProvider),
    ref.read(cacheManagerProvider),
    ref.read(loggerServiceProvider),
  );
});

///remote data source providers
final userRemoteDataSource = Provider(
  (ref) => UserRemoteDataSource(
    ref.read(apiManagerProvider),
  ),
);

///local data source providers
final userLocalDataProvider = Provider(
  (ref) => UserLocalDataSource(
    ref.read(cacheManagerProvider),
    ref.read(secureStorageManagerProvider),
  ),
);

///http repository providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    ref.read(userRemoteDataSource),
    ref.read(userLocalDataProvider),
  );
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(userRepositoryProvider));
});
