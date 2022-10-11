import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/core/utils/errors/app_exception.dart';
import 'package:riverpod_boilerplate/feature/auth/domain/models/user/user.dart';
import 'package:riverpod_boilerplate/shared/data/models/result/data_state.dart';
import 'package:riverpod_boilerplate/shared/domain/enums/account_type.dart';

import '../../../mocks/repositories/repositories_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  test(
    'should login user with google account',
    () async {
      const accountType = AccountType.google; //can be any account type
      const dataState = DataState<User>.success(
        User(
          name: "any_name",
          accountType: accountType,
        ),
      );
      // arrange
      when(mockAuthRepository.login(AccountType.google)).thenAnswer(
        (_) async => dataState,
      );
      // act
      final result = await mockAuthRepository.login(accountType);
      // assert
      expect(result, dataState);
      verify(mockAuthRepository.login(accountType));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'should return login.error on login failure',
    () async {
      const accountType = AccountType.google; //can be any account type
      const dataState = DataState<User>.error(
        AppException.unknownError('Login failed'),
      );
      // arrange
      when(mockAuthRepository.login(AccountType.google)).thenAnswer(
        (_) async => dataState,
      );
      // act
      final result = await mockAuthRepository.login(accountType);
      // assert
      expect(
        result,
        dataState,
      );
      verify(mockAuthRepository.login(accountType));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
