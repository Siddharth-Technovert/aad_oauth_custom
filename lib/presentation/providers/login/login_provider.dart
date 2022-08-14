import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/enums/account_type.dart';
import '../../../domain/service_providers.dart';
import '../../../domain/states/login/login_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../core/app_state_provider.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.read);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final Reader _read;
  late final LoginUser _loginUserUseCase = _read(loginUserUseCaseProvider);

  LoginNotifier(this._read) : super(const LoginState.initial());

  Future<void> signIn(AccountType accountType) async {
    state = const LoginState.loading();
    state = await _loginUserUseCase(accountType);
    state.maybeWhen(
      success: (userContext) async {
        await _read(appStateProvider.notifier).authenticateState(userContext);
        _read(loggerServiceProvider).logInfo(
          "login with $accountType account",
          className: "Login",
        );
      },
      orElse: () {},
    );
  }
}
