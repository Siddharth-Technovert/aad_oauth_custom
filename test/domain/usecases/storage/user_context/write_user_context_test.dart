import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';
import 'package:riverpod_boilerplate/domain/enums/account_type.dart';
import 'package:riverpod_boilerplate/domain/models/user_context/user_context.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockStorageManager mockStorageManager;

  setUp(() {
    mockStorageManager = MockStorageManager();
  });

  test(
    'should write user context to storage',
    () async {
      const userContext = UserContext(accountType: AccountType.guest);
      // arrange
      when(
        mockStorageManager.writeAsync(
          key: AppConstants.userContextKey,
          value: userContext,
        ),
      ).thenAnswer(
        (_) async => Future.value(),
      );
      // act
      await mockStorageManager.writeAsync(
        key: AppConstants.userContextKey,
        value: userContext,
      );
      // assert
      // expect(result, themeContext);
      verify(
        mockStorageManager.writeAsync(
          key: AppConstants.userContextKey,
          value: userContext,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );
}
