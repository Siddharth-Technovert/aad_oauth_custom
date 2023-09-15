import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/router/app_router.dart';
import '../../../data/data_service_providers.dart';

part 'router_provider.g.dart';

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter(
    ref.watch(secureStorageManagerProvider),
    ref.watch(loggerServiceProvider),
  );
}
