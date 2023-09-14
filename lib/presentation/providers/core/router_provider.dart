import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/router/app_router.dart';

part 'router_provider.g.dart';

@riverpod
Raw<AppRouter> appRouter(AppRouterRef ref) {
  return AppRouter();
}
