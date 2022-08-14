import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.gr.dart';

final appRouterProvider = Provider.autoDispose(
  (ref) => AppRouter(
      // routeGuard: RouteGuard(
      //   ref.read(appSecureStorageProvider),
      // ),
      ),
);
