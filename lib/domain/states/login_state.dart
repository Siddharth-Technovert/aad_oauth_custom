import 'package:flutter/foundation.dart';

import '../enums/account_type.dart';
import '../models/user/user.dart';

@immutable
sealed class LoginState {
  const LoginState();
}

final class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

final class LoginStateLoading extends LoginState {
  const LoginStateLoading({required this.accountType});

  final AccountType accountType;
}

final class LoginStateSuccess extends LoginState {
  const LoginStateSuccess({required this.user});

  final User user;
}

final class LoginStateError extends LoginState {
  const LoginStateError({required this.msg});

  final String msg;
}

extension LoginStateExtension on LoginState {
  User? get user => switch (this) {
        LoginStateSuccess(user: var user) => user,
        _ => null,
      };

  bool get isLogged => switch (this) {
        LoginStateSuccess() => true,
        _ => false,
      };

  bool get isLoading => switch (this) {
        LoginStateLoading(accountType: var _) => true,
        _ => false
      };
}
