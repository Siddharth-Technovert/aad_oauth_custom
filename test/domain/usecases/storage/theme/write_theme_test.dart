import 'package:flutter_test/flutter_test.dart';
import 'package:massy_stores/core/utils/constants/app_constants.dart';
import 'package:massy_stores/domain/states/core/theme/theme_state.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockSecureStorageManager mockSecureStorageManager;

  setUp(() {
    mockSecureStorageManager = MockSecureStorageManager();
  });

  test(
    'should write theme to storage',
    () async {
      const themeContext = ThemeState.light();
      // arrange
      when(
        mockSecureStorageManager.putAsync(
          key: AppConstants.themeKey,
          value: themeContext.val,
        ),
      ).thenAnswer(
        (_) async => Future.value(true),
      );
      // act
      await mockSecureStorageManager.putAsync(
        key: AppConstants.themeKey,
        value: themeContext.val,
      );
      // assert
      // expect(result, themeContext);
      verify(
        mockSecureStorageManager.putAsync(
          key: AppConstants.themeKey,
          value: themeContext.val,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );
}
