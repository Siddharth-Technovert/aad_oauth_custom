import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/device/background_service.dart';
// import '../../../domain/usecases/storage/jwt/jwt_usecases.dart';
import '../../../feature/auth/domain/models/user/user.dart';
import '../../../feature/auth/domain/usecases/user/user_usecases.dart';
import '../../../feature/service_providers.dart';
import '../../domain/states/app/app_state.dart';
import '../../domain/usecases/onboarding/onboarding_usecases.dart';

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

  late final ReadUser _readUserUseCase = _ref.read(readUserUseCaseProvider);
  // late final ReadJwt _readJwtUseCase = _read(readJwtTokenUseCaseProvider);

  late final ReadOnboarding _readOnboardingUseCase =
      _ref.read(readOnboardingUseCaseProvider);
  late final WriteOnboarding _writeOnboardingUseCase =
      _ref.read(writeOnboardingUseCaseProvider);

  AppStateNotifier(this._ref) : super(const AppState.initial()) {
    _init();
  }

  Future<void> _init() async {
    final isOnboardingDone = await _readOnboardingUseCase();

    if (isOnboardingDone) {
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
    } else {
      state = const AppState.unAuthenticated();
    }
    // } else {
    //   state = const AppState.onboarding();
    // }
    //? For now temporary solution
    await _ref.read(backgroundServiceProvider).registerPeriodicTask(
          "periodicTask",
          BackgroundService.periodicTask,
        );

    FlutterNativeSplash.remove();
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
