import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';
import 'package:riverpod_boilerplate/domain/states/core/theme/theme_state.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockStorageManager mockStorageManager;

  setUp(() {
    mockStorageManager = MockStorageManager();
  });

  test(
    'should write theme to storage',
    () async {
      const themeContext = ThemeState.light();
      // arrange
      when(
        mockStorageManager.writeStringAsync(
          key: AppConstants.themeKey,
          value: themeContext.val,
        ),
      ).thenAnswer(
        (_) async => Future.value(),
      );
      // act
      await mockStorageManager.writeStringAsync(
        key: AppConstants.themeKey,
        value: themeContext.val,
      );
      // assert
      // expect(result, themeContext);
      verify(
        mockStorageManager.writeStringAsync(
          key: AppConstants.themeKey,
          value: themeContext.val,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );
}
