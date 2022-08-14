import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';
import 'package:riverpod_boilerplate/domain/enums/account_type.dart';
import 'package:riverpod_boilerplate/domain/models/user_context/user_context.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/user_context/user_context_usecases.dart';
import 'package:riverpod_boilerplate/presentation/ui/screens/app_start_screen.dart';
import 'package:riverpod_boilerplate/presentation/ui/screens/login/login_screen.dart';

import '../../../mocks/usecases/usecases_mock.mocks.dart';
import '../localization_app.dart';

void main() {
  late MockReadUserContext mockReadUserContext;
  setUpAll(() {
    mockReadUserContext = MockReadUserContext();
  });

  Widget testingScreen(MockReadUserContext mockReadUserContext) {
    return ProviderScope(
      overrides: [
        readUserContextUseCaseProvider.overrideWithValue(mockReadUserContext),
      ],
      child: const LocalizationApp(child: AppStartScreen()),
    );
  }

  void arrangeReadUserContext(UserContext? userContext) {
    when(mockReadUserContext()).thenAnswer(
      (_) async => userContext,
    );
  }

  group(
    "AppStartScreen test",
    () {
      // test('has a route', () {
      //   expect(AppStartRoute, isA<MaterialPageRoute>());
      // });
      testWidgets('renders a AppStartScreen', (tester) async {
        //act
        await tester.pumpWidget(
          const ProviderScope(
            child: LocalizationApp(child: AppStartScreen()),
          ),
        );
        //expect
        expect(find.byType(AppStartScreen), findsOneWidget);
      });

      testWidgets('show SplashScreen when app state is initial',
          (tester) async {
        //arrange
        arrangeReadUserContext(null);
        //act
        await tester.pumpWidget(testingScreen(mockReadUserContext));
        //assert
        expect(find.byType(SizedBox), findsOneWidget);
        await tester.pump(const Duration(milliseconds: 500));
      });

      testWidgets('show LoginScreen when app state is unAuthenticated',
          (tester) async {
        //arrange
        arrangeReadUserContext(null);
        //act
        await tester.pumpWidget(testingScreen(mockReadUserContext));
        //assert
        expect(find.byType(SizedBox), findsOneWidget);
        await tester.pump(const Duration(milliseconds: 500));
        expect(find.byType(LoginScreen), findsOneWidget);
      });

      testWidgets('show DashboardScreen when app state is authenticated',
          (tester) async {
        //arrange
        arrangeReadUserContext(
          const UserContext(
            accountType: AccountType.guest,
          ),
        );
        //act
        await tester.pumpWidget(testingScreen(mockReadUserContext));
        //assert
        expect(find.byType(SizedBox), findsOneWidget);
        await tester.pump(
          const Duration(
            milliseconds: 500,
          ),
        ); //this is for app context notifier _init
        await tester.pump(
          const Duration(seconds: 1),
        ); //this is for dashboard notifier _init
        expect(find.byKey(AppConstants.homeScreenKey), findsOneWidget);
        // tester.pumpAndSettle();
      });
    },
  );
}
