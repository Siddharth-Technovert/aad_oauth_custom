import 'package:auto_route/auto_route.dart';

import '../../data/data_source/local/secure_storage/secure_storage_manager.dart';
import '../configs/constants/app_constants.dart';
import 'app_router.gr.dart';

class RouteGuard extends AutoRouteGuard {
  final SecureStorageManager _secureStorageManager;
  RouteGuard(this._secureStorageManager);

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
      router
          .push(
            const AppStartRoute(),
          )
          .then(
            (value) => resolver.next(),
          );
    }
  }
}
