import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_service_providers.dart';
import '../../../domain/enums/account_type.dart';
import '../../../domain/enums/toast_type.dart';
import '../../../domain/states/login/login_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../../ui/modals/snack_bar/snack_bar_factory.dart';
import '../core/app_state_provider.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginState get currentState => state;

  final Ref _ref;
  late final LoginUser _loginUserUseCase = _ref.watch(loginUserUseCaseProvider);

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
    await dataState.when(
      success: (user) async {
        state = LoginState.success(user);
        await _ref.read(appStateProvider.notifier).authenticateState(user);
        _ref.read(loggerServiceProvider).infoLog(
              "login with $accountType account",
              className: "Login",
            );
      },
      error: (ex) {
        SnackbarFactory.showToast(ToastType.error, "Something Went Wrong");
      },
    );
  }
}
