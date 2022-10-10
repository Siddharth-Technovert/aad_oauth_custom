import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/service_providers.dart';
import '../../../domain/states/home/home_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../core/app_state_provider.dart';
import '../core/user_state_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref);
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeState get currentState => state;

  final Ref _ref;
  late final LogoutUser _logoutUserUseCase =
      _ref.read(logoutUserUseCaseProvider);

  HomeNotifier(
    this._ref,
  ) : super(const HomeState.initial()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> logout() async {
    _ref.read(userStateProvider).maybeWhen(
          available: (user) => _logoutUserUseCase(user.accountType),
          orElse: () {},
        );
    await _ref.read(appStateProvider.notifier).unAuthenticateState();
    // state = const HomeState.loggedOut();
    _ref.read(loggerServiceProvider).infoLog(
          "logout user",
          className: "Home",
        );
  }
}
