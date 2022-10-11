import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_boilerplate/shared/domain/enums/account_type.dart';

import '../../../mocks/repositories/repositories_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  test(
    'should logout user',
    () async {
      const accountType = AccountType.google; //can be any account type
      // arrange
      when(mockAuthRepository.logout(accountType)).thenAnswer(
        (_) async => Future.value(),
      );
      // act
      await mockAuthRepository.logout(accountType);
      // assert
      // expect(result, isNotNull);
      verify(mockAuthRepository.logout(accountType));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
