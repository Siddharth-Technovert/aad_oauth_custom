import 'package:auto_route/auto_route.dart';

import '../../logger/logger_service.dart';
import '../../utils/app_constants.dart';
import '../../utils/local_storage/secure/secure_storage_manager.dart';
import '../app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final SecureStorageManager _secureStorageManager;
  final LoggerService _logger;
  AuthGuard(this._secureStorageManager, this._logger);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final token = await _secureStorageManager.getAsync(
      key: AppConstants.tokenKey,
    );
    if (token != null) {
      resolver.next();
    } else {
      _logger.infoLog("User token is invalid. Redirecting to Login");
      router.replaceAll(
        [const LoginRoute()],
      ).then(
        (value) => resolver.next(),
      );
    }
  }
}
