import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/user_context/user_context.dart';
import '../../../domain/states/core/app/app_state.dart';
import '../../../domain/usecases/auth/auth_usecases.dart';
import '../../../domain/usecases/storage/user_context/user_context_usecases.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(ref.read);
});

class AppStateNotifier extends StateNotifier<AppState> {
  AppState get currentState => state;
  set currentState(AppState appState) {
    state = appState;
  }

  final Reader _read;

  late final ReadUserContext _readUserContextUseCase =
      _read(readUserContextUseCaseProvider);
  late final WriteUserContext _writeUserContextUseCase =
      _read(writeUserContextUseCaseProvider);
  late final RemoveUserContext _removeUserContextUseCase =
      _read(removeUserContextUseCaseProvider);

  late final LogoutUser _logoutUserUseCase = _read(logoutUserUseCaseProvider);

  AppStateNotifier(this._read) : super(const AppState.initial()) {
    _init();
  }

  Future<void> _init() async {
    final userContext = await _readUserContextUseCase();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (userContext == null) {
        state = const AppState.unAuthenticated();
      } else {
        state = AppState.authenticated(userContext);
      }
    });
    FlutterNativeSplash.remove();
  }

  Future<void> authenticateState(UserContext userContext) async {
    await _writeUserContextUseCase(userContext);
    state = AppState.authenticated(userContext);
  }

  Future<void> unAuthenticateState() async {
    state.maybeWhen(
      authenticated: (userContext) =>
          _logoutUserUseCase(userContext.accountType!),
      orElse: () {},
    );
    await _removeUserContextUseCase();
    state = const AppState.unAuthenticated();
  }
}
