import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/domain/enums/account_type.dart';
import 'package:riverpod_boilerplate/domain/models/user_context/user_context.dart';
import 'package:riverpod_boilerplate/domain/states/core/app/app_state.dart';
import 'package:riverpod_boilerplate/domain/usecases/auth/auth_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/user_context/user_context_usecases.dart';
import 'package:riverpod_boilerplate/presentation/providers/core/app_state_provider.dart';

import '../../../mocks/usecases/usecases_mock.mocks.dart';

Future<void> main() async {
  late MockReadUserContext mockReadUserContext;
  late MockWriteUserContext mockWriteUserContext;
  late MockRemoveUserContext mockRemoveUserContext;
  late MockLogoutUser mockLogoutUser;

  setUpAll(() {
    mockReadUserContext = MockReadUserContext();
    mockWriteUserContext = MockWriteUserContext();
    mockRemoveUserContext = MockRemoveUserContext();
    mockLogoutUser = MockLogoutUser();

    when(mockReadUserContext()).thenAnswer(
      (_) async => null,
    );
  });

  ProviderContainer serProviderContainer(
    MockReadUserContext mockReadUserContext,
    MockWriteUserContext mockWriteUserContext,
    MockRemoveUserContext mockRemoveUserContext,
    MockLogoutUser mockLogoutUser,
  ) {
    return ProviderContainer(
      overrides: [
        readUserContextUseCaseProvider.overrideWithValue(mockReadUserContext),
        writeUserContextUseCaseProvider.overrideWithValue(mockWriteUserContext),
        removeUserContextUseCaseProvider
            .overrideWithValue(mockRemoveUserContext),
        logoutUserUseCaseProvider.overrideWithValue(mockLogoutUser),
      ],
    );
  }

  void arrangeWriteUserContext(UserContext userContext) {
    when(mockWriteUserContext(userContext)).thenAnswer(
      (_) async => Future.value(),
    );
  }

  group('AppStateNotifier', () {
    test(
      'Starting state is initial',
      () {
        final container = serProviderContainer(
          mockReadUserContext,
          mockWriteUserContext,
          mockRemoveUserContext,
          mockLogoutUser,
        );
        const appState = AppState.initial();
        expect(
          AppStateNotifier(container.read).currentState,
          appState,
        );
        container.dispose();
      },
    );

    group("Authenticate State", () {
      test(
        'update app state to authenticate when user get logged in',
        () async {
          //arrange
          const userContext = UserContext(
            accountType: AccountType.google,
          );
          arrangeWriteUserContext(userContext);
          //act
          final container = serProviderContainer(
            mockReadUserContext,
            mockWriteUserContext,
            mockRemoveUserContext,
            mockLogoutUser,
          );
          final appStateNotifier = AppStateNotifier(container.read);
          await appStateNotifier.authenticateState(userContext);
          expect(
            appStateNotifier.currentState,
            const AppState.authenticated(userContext),
          );
          container.dispose();
        },
      );
    });

    group("UnAuthenticate State", () {
      test(
        'update app state to unAuthenticate when user get logged out',
        () async {
          //arrange
          const userContext = UserContext(
            accountType: AccountType.google,
          );
          when(mockLogoutUser(userContext.accountType)).thenAnswer(
            (_) async => Future.value(),
          );
          //act
          final container = serProviderContainer(
            mockReadUserContext,
            mockWriteUserContext,
            mockRemoveUserContext,
            mockLogoutUser,
          );
          final appStateNotifier = AppStateNotifier(container.read);
          appStateNotifier.currentState =
              const AppState.authenticated(userContext);
          await appStateNotifier.unAuthenticateState();
          //assert
          expect(
            appStateNotifier.currentState,
            const AppState.unAuthenticated(),
          );
          container.dispose();
        },
      );
    });
  });
}
