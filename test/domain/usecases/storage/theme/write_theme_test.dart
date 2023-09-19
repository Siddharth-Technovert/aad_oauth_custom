import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/utils/app_constants.dart';
import 'package:riverpod_boilerplate/domain/states/core/theme_state.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockSecureStorageManager mockSecureStorageManager;

  setUp(() {
    mockSecureStorageManager = MockSecureStorageManager();
  });

  test(
    'should write theme to storage',
    () async {
      const themeContext = ThemeStateLight();
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
