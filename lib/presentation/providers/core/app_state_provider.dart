import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/app_bootstrapper.dart';
import '../../../data/data_service_providers.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/states/core/app_state.dart';
import '../../../domain/usecases/storage/onboarding/onboarding_usecases.dart';
import '../../../domain/usecases/user/user_usecases.dart';

part 'app_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  late final ReadUser _readUserUseCase = ref.watch(readUserUseCaseProvider);
  // late final ReadJwt _readJwtUseCase = _read(readJwtTokenUseCaseProvider);

  // late final ReadOnboarding _readOnboardingUseCase =
  //     _ref.watch(readOnboardingUseCaseProvider);
  late final WriteOnboarding _writeOnboardingUseCase =
      ref.watch(writeOnboardingUseCaseProvider);

  @override
  AppState build() {
    _init();
    return const AppStateInitial();
  }

  Future<void> _init() async {
    await ref.read(connectivityServiceProvider).checkConnectivity();

    //TODO: Uncomment onboarding and jwt code if require in the app
    // final isOnboardingDone = await _readOnboardingUseCase();

    // if (isOnboardingDone) {
    // final jwt = await _readJwtUseCase();
    // if (jwt != null) {
    final dataState = await _readUserUseCase();

    switch (dataState) {
      case DataStateSuccess<User>(data: var user):
        //? is state authenticated and want to do some background task
        // await _read(backgroundServiceProvider).registerPeriodicTask(
        //   "periodicTask",
        //   BackgroundService.periodicTask,
        // );
        state = AppStateAuthenticated(user: user);
      case DataStateError<User>():
        state = const AppStateUnAuthenticated();
    }
    // } else {
    //   state = const AppStateUnAuthenticated();
    // }
    // } else {
    //   state = const AppStateOnboarding();
    // }

    SplashFactory.remove();
  }

  Future<void> completeOnboarding() async {
    await _writeOnboardingUseCase(true);
    state = const AppStateUnAuthenticated();
  }

  Future<void> authenticateState(User user) async {
    state = AppStateAuthenticated(user: user);
  }

  Future<void> unAuthenticateState() async {
    state = const AppStateUnAuthenticated();
  }
}
