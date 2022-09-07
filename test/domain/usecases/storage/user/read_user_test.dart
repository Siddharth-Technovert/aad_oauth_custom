import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/configs/constants/app_constants.dart';
import 'package:riverpod_boilerplate/domain/enums/account_type.dart';
import 'package:riverpod_boilerplate/domain/models/user/user.dart';

import '../../../../mocks/storage/storage_mock.mocks.dart';

void main() {
  late MockSecureStorageManager mockSecureStorageManager;

  setUp(() {
    mockSecureStorageManager = MockSecureStorageManager();
  });

  test(
    'should read user context',
    () async {
      const user = User(name: "any_name", accountType: AccountType.guest);
      // arrange
      when(
        mockSecureStorageManager.getAsync(
          key: AppConstants.userKey,
        ),
      ).thenAnswer((_) async => jsonEncode(user.toJson()));
      // act
      final result = await mockSecureStorageManager.getAsync(
        key: AppConstants.userKey,
      );
      // assert
      expect(result, user);
      verify(
        mockSecureStorageManager.getAsync(
          key: AppConstants.userKey,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );

  test(
    'should return null on unable to read user context',
    () async {
      // arrange
      when(
        mockSecureStorageManager.getAsync(
          key: AppConstants.userKey,
        ),
      ).thenAnswer(
        (_) async => null,
      );
      // act
      final result = await mockSecureStorageManager.getAsync(
        key: AppConstants.userKey,
      );
      // assert
      expect(result, null);
      verify(
        mockSecureStorageManager.getAsync(
          key: AppConstants.userKey,
        ),
      );
      verifyNoMoreInteractions(mockSecureStorageManager);
    },
  );
}
