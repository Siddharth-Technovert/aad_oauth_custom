import '../../models/user/user.dart';

sealed class AppState {}

class AppStateInitial implements AppState {
  const AppStateInitial();
}

class AppStateOnboarding implements AppState {
  const AppStateOnboarding();
}

class AppStateUnAuthenticated implements AppState {
  const AppStateUnAuthenticated();
}

class AppStateAuthenticated implements AppState {
  final User user;
  const AppStateAuthenticated({required this.user});
}
