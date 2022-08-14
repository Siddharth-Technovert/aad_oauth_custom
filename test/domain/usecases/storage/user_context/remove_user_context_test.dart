import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockStorageManager mockStorageManager;

  setUp(() {
    mockStorageManager = MockStorageManager();
  });

  test(
    'should remove user context from storage',
    () async {
      // arrange
      when(
        mockStorageManager.deleteAsync(
          key: AppConstants.userContextKey,
        ),
      ).thenAnswer(
        (_) async => Future.value(),
      );
      // act
      await mockStorageManager.deleteAsync(
        key: AppConstants.userContextKey,
      );
      // assert
      // expect(result, themeContext);
      verify(
        mockStorageManager.deleteAsync(
          key: AppConstants.userContextKey,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );
}
