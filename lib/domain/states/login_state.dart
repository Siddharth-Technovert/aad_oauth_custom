import '../enums/account_type.dart';
import '../models/user/user.dart';

sealed class LoginState {}

class LoginStateInitial implements LoginState {
  const LoginStateInitial();
}

class LoginStateLoading implements LoginState {
  const LoginStateLoading({required this.accountType});

  final AccountType accountType;
}

class LoginStateSuccess implements LoginState {
  const LoginStateSuccess({required this.user});

  final User user;
}

class LoginStateError implements LoginState {
  const LoginStateError({required this.msg});

  final String msg;
}

extension LoginStateExtension on LoginState {
  User? get user => switch (this) {
        LoginStateSuccess(user: var user) => user,
        _ => null,
      };

  bool get isLoading => switch (this) {
        LoginStateLoading(accountType: var _) => true,
        _ => false
      };
}
