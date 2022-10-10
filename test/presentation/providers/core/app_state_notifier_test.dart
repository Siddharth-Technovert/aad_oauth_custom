import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/utils/errors/app_exception.dart';
import 'package:riverpod_boilerplate/data/models/result/data_state.dart';
import 'package:riverpod_boilerplate/domain/enums/account_type.dart';
import 'package:riverpod_boilerplate/domain/models/user/user.dart';
import 'package:riverpod_boilerplate/domain/states/core/app/app_state.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/onboarding/onboarding_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/user/user_usecases.dart';
import 'package:riverpod_boilerplate/presentation/providers/core/app_state_provider.dart';

import '../../../mocks/usecases/usecases_mock.mocks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late MockReadUser mockReadUser;
  late MockReadOnboarding mockReadOnboarding;
  late MockWriteOnboarding mockWriteOnboarding;

  setUpAll(() {
    mockReadUser = MockReadUser();
    mockReadOnboarding = MockReadOnboarding();
    mockWriteOnboarding = MockWriteOnboarding();

    when(mockReadUser()).thenAnswer(
      (_) async => const DataState.error(
        AppException.unknownError("Some error Occurred"),
      ),
    );
    when(mockReadOnboarding()).thenAnswer(
      (_) async => true,
    );
    when(mockWriteOnboarding(true)).thenAnswer(
      (_) async {},
    );
  });

  ProviderContainer setProviderContainer(
    MockReadUser mockReadUser,
    MockReadOnboarding mockReadOnboarding,
    MockWriteOnboarding mockWriteOnboarding,
  ) {
    return ProviderContainer(
      overrides: [
        readUserUseCaseProvider.overrideWithValue(mockReadUser),
        readOnboardingUseCaseProvider.overrideWithValue(mockReadOnboarding),
        writeOnboardingUseCaseProvider.overrideWithValue(mockWriteOnboarding),
      ],
    );
  }

  group('AppStateNotifier', () {
    test(
      'Starting state is initial',
      () {
        final container = setProviderContainer(
          mockReadUser,
          mockReadOnboarding,
          mockWriteOnboarding,
        );
        const appState = AppState.initial();
        expect(
          container.read(appStateProvider.notifier).currentState,
          appState,
        );
        // container.dispose();
      },
    );

    group("Complete Onboarding State", () {
      test(
        'update app state to unAuthenticate when onboarding completed',
        () async {
          //arrange
          when(mockWriteOnboarding(true)).thenAnswer(
            (_) async {},
          );
          //act
          final container = setProviderContainer(
            mockReadUser,
            mockReadOnboarding,
            mockWriteOnboarding,
          );
          final appStateNotifier = container.read(appStateProvider.notifier);
          await appStateNotifier.completeOnboarding();
          expect(
            appStateNotifier.currentState,
            const AppState.unAuthenticated(),
          );
          // container.dispose();
        },
      );
    });

    group("Authenticate State", () {
      test(
        'update app state to authenticate',
        () async {
          //arrange
          const user = User(
            name: "",
            accountType: AccountType.google,
          );
          //act
          final container = setProviderContainer(
            mockReadUser,
            mockReadOnboarding,
            mockWriteOnboarding,
          );
          final appStateNotifier = container.read(appStateProvider.notifier);
          await appStateNotifier.authenticateState(user);
          expect(
            appStateNotifier.currentState,
            const AppState.authenticated(user),
          );
          // container.dispose();
        },
      );
    });

    group("UnAuthenticate State", () {
      test(
        'update app state to unAuthenticate',
        () async {
          //act
          final container = setProviderContainer(
            mockReadUser,
            mockReadOnboarding,
            mockWriteOnboarding,
          );
          final appStateNotifier = container.read(appStateProvider.notifier);
          await appStateNotifier.unAuthenticateState();
          //assert
          expect(
            appStateNotifier.currentState,
            const AppState.unAuthenticated(),
          );
          // container.dispose();
        },
      );
    });
  });
}
