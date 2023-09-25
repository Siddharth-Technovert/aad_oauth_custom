import 'package:flutter/foundation.dart';

import '../../models/user/user.dart';

@immutable
sealed class AppState {
  const AppState();
}

final class AppStateInitial extends AppState {
  const AppStateInitial();
}

final class AppStateOnboarding extends AppState {
  const AppStateOnboarding();
}

final class AppStateUnAuthenticated extends AppState {
  const AppStateUnAuthenticated();
}

final class AppStateAuthenticated extends AppState {
  final User user;
  const AppStateAuthenticated({required this.user});
}
