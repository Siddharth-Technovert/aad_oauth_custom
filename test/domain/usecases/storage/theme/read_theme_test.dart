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
    'should read theme',
    () async {
      const themeState = ThemeState.light();
      // arrange
      when(
        mockStorageManager.readStringAsync(
          key: AppConstants.themeKey,
        ),
      ).thenAnswer((_) async => themeState.val);
      // act
      final result = await mockStorageManager.readStringAsync(
        key: AppConstants.themeKey,
      );
      // assert
      expect(result, themeState.val);
      verify(
        mockStorageManager.readStringAsync(
          key: AppConstants.themeKey,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );

  test(
    'should return null on unable to read theme',
    () async {
      // arrange
      when(
        mockStorageManager.readStringAsync(
          key: AppConstants.themeKey,
        ),
      ).thenAnswer(
        (_) async => null,
      );
      // act
      final result = await mockStorageManager.readStringAsync(
        key: AppConstants.themeKey,
      );
      // assert
      expect(result, null);
      verify(
        mockStorageManager.readStringAsync(
          key: AppConstants.themeKey,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );
}
