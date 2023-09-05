import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/router/app_router.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
class AppRouterNotifier extends _$AppRouterNotifier {
  @override
  AppRouter build() {
    return AppRouter();
  }
}
