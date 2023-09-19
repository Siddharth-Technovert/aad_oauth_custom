import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_boilerplate/presentation/ui/screens/login/login_screen.dart';

// import '../../../mocks/usecases/usecases_mock.mocks.dart';
import '../localization_app.dart';

void main() {
  group(
    "LoginScreen test",
    () {
      testWidgets('renders a LoginScreen', (tester) async {
        //act
        await tester.pumpWidget(
          const ProviderScope(
            child: LocalizationApp(child: LoginScreen()),
          ),
        );
        //expect
        expect(find.byType(LoginScreen), findsOneWidget);
      });
    },
  );
}
