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
    'should read theme',
    () async {
      const themeState = ThemeStateLight();
      // arrange
      when(
        mockSecureStorageManager.getAsync(
          key: AppConstants.themeKey,
        ),
      ).thenAnswer((_) async => themeState.val);
      // act
      final result = await mockSecureStorageManager.getAsync(
        key: AppConstants.themeKey,
      );
      // assert
      expect(result, themeState.val);
      verify(
        mockSecureStorageManager.getAsync(
          key: AppConstants.themeKey,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );

  test(
    'should return null on unable to read theme',
    () async {
      // arrange
      when(
        mockSecureStorageManager.getAsync(
          key: AppConstants.themeKey,
        ),
      ).thenAnswer(
        (_) async => null,
      );
      // act
      final result = await mockSecureStorageManager.getAsync(
        key: AppConstants.themeKey,
      );
      // assert
      expect(result, null);
      verify(
        mockSecureStorageManager.getAsync(
          key: AppConstants.themeKey,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );
}
