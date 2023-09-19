import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/data_service_providers.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/enums/account_type.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/states/login_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../../ui/modals/snack_bar/snack_bar_factory.dart';
import '../core/app_state_provider.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  late final LoginUser _loginUserUseCase = ref.watch(loginUserUseCaseProvider);
  @override
  LoginState build() {
    return const LoginStateInitial();
  }

  Future<void> logIn(
    AccountType accountType, {
    required bool isSignInButton,
  }) async {
    state = LoginStateLoading(accountType: accountType);
    final dataState = await _loginUserUseCase(accountType);
    switch (dataState) {
      case DataStateSuccess<User>(data: var user):
        state = LoginStateSuccess(user: user);
        await ref
            .read(appStateNotifierProvider.notifier)
            .authenticateState(user);
        ref.read(loggerServiceProvider).infoLog(
              "login with $accountType account",
              className: "Login",
            );
      case DataStateError<User>(ex: var _):
        SnackbarFactory.showError("Something Went Wrong");
    }
  }
}
