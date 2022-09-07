import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockSecureStorageManager mockSecureStorageManager;

  setUp(() {
    mockSecureStorageManager = MockSecureStorageManager();
  });

  test(
    'should remove user context from storage',
    () async {
      // arrange
      when(
        mockSecureStorageManager.deleteAsync(
          key: AppConstants.userKey,
        ),
      ).thenAnswer(
        (_) async => Future.value(),
      );
      // act
      await mockSecureStorageManager.deleteAsync(
        key: AppConstants.userKey,
      );
      // assert
      // expect(result, themeContext);
      verify(
        mockSecureStorageManager.deleteAsync(
          key: AppConstants.userKey,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );
}
