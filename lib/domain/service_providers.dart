import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/configs/app_configuration.dart';
import '../core/device/background_service.dart';
import '../core/device/connectivity_service.dart';
import '../core/device/deeplink_service.dart';
import '../core/device/file_picker_service.dart';
import '../core/device/local_auth/local_auth_service.dart';
import '../core/device/local_auth/support_state_service.dart';
import '../core/device/local_notification_service.dart';
import '../core/device/logger_service.dart';
import '../core/device/permission_service.dart';
import '../data/data_source/api/api_manager/api_manager.dart';
import '../data/data_source/api/api_manager/api_manager_impl.dart';
import '../data/data_source/api_cache_client.dart';
import '../data/data_source/api_client.dart';
import '../data/data_source/local/cache/cache_manager.dart';
import '../data/data_source/local/cache/cache_manager_impl.dart';
import '../data/data_source/local/db/hive_db.dart';
import '../data/data_source/local/db/sqlite_db.dart';
import '../data/data_source/local/secure_storage/secure_storage_manager.dart';
import '../data/data_source/local/secure_storage/secure_storage_manager_impl.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'repositories/user_repository.dart';

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

final hiveDbProvider = Provider((_) => HiveDb());
final sqlDbProvider = Provider((_) => SQLiteDb());

///data source providers
final secureStorageManagerProvider = Provider<SecureStorageManager>(
  (_) => SecureStorageManagerImpl(),
);
final cacheManagerProvider = Provider<CacheManager>(
  (_) => CacheManagerImpl(),
);
final apiManagerProvider = Provider<ApiManager>((ref) {
  return ApiManagerImpl(
    AppConfiguration.baseUrl,
    ref.read(loggerServiceProvider),
    ref.read(secureStorageManagerProvider),
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
  );
});

///http repository providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    ref.read(apiManagerProvider),
    ref.read(secureStorageManagerProvider),
    ref.read(cacheManagerProvider),
  );
});
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(userRepositoryProvider));
});
