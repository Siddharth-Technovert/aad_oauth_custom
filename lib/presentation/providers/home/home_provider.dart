import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_service_providers.dart';
import '../../../domain/states/home_state.dart';
import '../../../domain/states/user_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../core/app_state_provider.dart';
import '../core/router_provider.dart';
import '../core/user_state_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref);
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeState get currentState => state;

  final Ref _ref;
  late final LogoutUser _logoutUserUseCase =
      _ref.watch(logoutUserUseCaseProvider);

  HomeNotifier(
    this._ref,
  ) : super(const HomeStateInitial()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> logout() async {
    switch (_ref.read(userStateProvider)) {
      case UserStateAvailable(user: var user):
        _logoutUserUseCase(user.accountType);
      default:
    }
    _ref.read(appRouterProvider).pop();
    await _ref.read(appStateProvider.notifier).unAuthenticateState();
    // state = const HomeState.loggedOut();
    _ref.read(loggerServiceProvider).infoLog(
          "logout user",
          className: "Home",
        );
  }
}
