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
    'should read user context',
    () async {
      const userContext = UserContext(accountType: AccountType.guest);
      // arrange
      when(
        mockStorageManager.readAsync<UserContext>(
          key: AppConstants.userContextKey,
        ),
      ).thenAnswer((_) async => userContext);
      // act
      final result = await mockStorageManager.readAsync<UserContext>(
        key: AppConstants.userContextKey,
      );
      // assert
      expect(result, userContext);
      verify(
        mockStorageManager.readAsync<UserContext>(
          key: AppConstants.userContextKey,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );

  test(
    'should return null on unable to read user context',
    () async {
      // arrange
      when(
        mockStorageManager.readAsync<UserContext>(
          key: AppConstants.userContextKey,
        ),
      ).thenAnswer(
        (_) async => null,
      );
      // act
      final result = await mockStorageManager.readAsync<UserContext>(
        key: AppConstants.userContextKey,
      );
      // assert
      expect(result, null);
      verify(
        mockStorageManager.readAsync<UserContext>(
          key: AppConstants.userContextKey,
        ),
      );
      verifyNoMoreInteractions(mockStorageManager);
    },
  );
}
