import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/service_providers.dart';
import '../../../domain/states/home/home_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../core/app_state_provider.dart';
import '../core/user_state_provider.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref.read);
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeState get currentState => state;

  final Reader _read;
  late final LogoutUser _logoutUserUseCase = _read(logoutUserUseCaseProvider);

  HomeNotifier(
    this._read,
  ) : super(const HomeState.initial()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> logout() async {
    _read(userStateProvider).maybeWhen(
      available: (user) => _logoutUserUseCase(user.accountType),
      orElse: () {},
    );
    await _read(appStateProvider.notifier).unAuthenticateState();
    // state = const HomeState.loggedOut();
    _read(loggerServiceProvider).infoLog(
      "logout user",
      className: "Home",
    );
  }
}
