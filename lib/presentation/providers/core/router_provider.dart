import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';

final appRouterProvider = Provider(
  (ref) => AppRouter(),
);
