import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/enums/account_type.dart';
import '../../../domain/service_providers.dart';
import '../../../domain/states/login/login_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../core/app_state_provider.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginState get currentState => state;

  final Ref _ref;
  late final LoginUser _loginUserUseCase = _ref.read(loginUserUseCaseProvider);

  LoginNotifier(
    this._ref,
  ) : super(const LoginState.initial()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> logIn(
    AccountType accountType, {
    required bool isSignInButton,
  }) async {
    state = LoginState.loading(accountType);
    final dataState = await _loginUserUseCase(accountType);
    dataState.when(
      success: (user) async {
        state = LoginState.success(user);
        await _ref.read(appStateProvider.notifier).authenticateState(user);
        _ref.read(loggerServiceProvider).infoLog(
              "login with $accountType account",
              className: "Login",
            );
      },
      error: (ex) => state = LoginState.error(ex),
    );
  }
}
