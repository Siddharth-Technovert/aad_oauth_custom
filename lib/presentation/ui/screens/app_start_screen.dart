import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/core/app_state_provider.dart';
import 'landing/landing_screen.dart';
import 'login/login_screen.dart';

class AppStartScreen extends ConsumerWidget {
  const AppStartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appStateProvider).when(
          initial: () => const SizedBox.shrink(),
          onboarding: () => const SizedBox.shrink(),
          unAuthenticated: () => const LoginScreen(),
          authenticated: (user) => const LandingScreen(),
        );
  }
}
