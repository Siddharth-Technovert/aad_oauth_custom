import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_bootstrapper.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/states/core/app/app_state.dart';
import '../../../domain/usecases/storage/onboarding/onboarding_usecases.dart';
import '../../../domain/usecases/user/user_usecases.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(ref);
});

class AppStateNotifier extends StateNotifier<AppState> {
  AppState get currentState => state;
  set currentState(AppState appState) {
    state = appState;
  }

  final Ref _ref;

  late final ReadUser _readUserUseCase = _ref.watch(readUserUseCaseProvider);
  // late final ReadJwt _readJwtUseCase = _read(readJwtTokenUseCaseProvider);

  // late final ReadOnboarding _readOnboardingUseCase =
  //     _ref.watch(readOnboardingUseCaseProvider);
  late final WriteOnboarding _writeOnboardingUseCase =
      _ref.watch(writeOnboardingUseCaseProvider);

  AppStateNotifier(this._ref) : super(const AppState.initial()) {
    _init();
  }

  Future<void> _init() async {
    //TODO: Uncomment onboarding and jwt code if require in the app
    // final isOnboardingDone = await _readOnboardingUseCase();

    // if (isOnboardingDone) {
    // final jwt = await _readJwtUseCase();
    // if (jwt != null) {
    final dataState = await _readUserUseCase();
    dataState.when(
      success: (user) {
        //? is state authenticated and want to do some background task
        // await _read(backgroundServiceProvider).registerPeriodicTask(
        //   "periodicTask",
        //   BackgroundService.periodicTask,
        // );
        state = AppState.authenticated(user);
      },
      error: (ex) {
        state = const AppState.unAuthenticated();
      },
    );
    // } else {
    //   state = const AppState.unAuthenticated();
    // }
    // } else {
    //   state = const AppState.onboarding();
    // }

    SplashFactory.remove();
  }

  Future<void> completeOnboarding() async {
    await _writeOnboardingUseCase(true);
    state = const AppState.unAuthenticated();
  }

  Future<void> authenticateState(User user) async {
    state = AppState.authenticated(user);
  }

  Future<void> unAuthenticateState() async {
    state = const AppState.unAuthenticated();
  }
}
