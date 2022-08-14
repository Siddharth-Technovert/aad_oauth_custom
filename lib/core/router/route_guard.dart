import 'package:auto_route/auto_route.dart';

import '../../data/data_source/local/storage_manager.dart';
import '../configs/constants/app_constants.dart';
import 'app_router.gr.dart';

class RouteGuard extends AutoRouteGuard {
  final StorageManager _storageManager;
  RouteGuard(this._storageManager);

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final token = await _storageManager.readStringAsync(
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
