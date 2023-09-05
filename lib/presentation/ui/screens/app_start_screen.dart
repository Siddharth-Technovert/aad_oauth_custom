import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/states/core/app_state.dart';
import '../../providers/core/app_state_provider.dart';
import '../../providers/core/connectivity_provider.dart';
import 'landing/landing_screen.dart';
import 'login/login_screen.dart';

class AppStartScreen extends ConsumerWidget {
  const AppStartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(connectivityStatusProvider);
    return switch (ref.watch(appStateNotifierProvider)) {
      AppStateInitial() => const SizedBox.shrink(),
      AppStateOnboarding() => const SizedBox.shrink(),
      AppStateUnAuthenticated() => const LoginScreen(),
      AppStateAuthenticated(user: var _) => const LandingScreen(),
    };
  }
}
