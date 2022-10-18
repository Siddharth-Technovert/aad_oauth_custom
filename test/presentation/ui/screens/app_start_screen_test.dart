import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:massy_stores/presentation/ui/screens/app_start_screen.dart';

// import '../../../mocks/usecases/usecases_mock.mocks.dart';
import '../localization_app.dart';

void main() {
  group(
    "AppStartScreen test",
    () {
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
    },
  );
}
