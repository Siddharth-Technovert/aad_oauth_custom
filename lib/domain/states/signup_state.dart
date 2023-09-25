import 'package:flutter/foundation.dart';

import '../../core/utils/errors/app_exception.dart';
import '../enums/account_type.dart';
import '../models/user/user.dart';

@immutable
sealed class SignupState {
  const SignupState();
}

final class SignupStateInitial extends SignupState {
  const SignupStateInitial();
}

final class SignupStateLoading extends SignupState {
  const SignupStateLoading({required this.accountType});
  final AccountType accountType;
}

final class SignupStateSuccess extends SignupState {
  const SignupStateSuccess({required this.user});
  final User user;
}

final class SignupStateError extends SignupState {
  const SignupStateError({required this.ex});
  final AppException ex;
}

extension SignUpStateExtension on SignupState {
  User? get user => switch (this) {
        SignupStateSuccess(user: var user) => user,
        _ => null,
      };

  bool get isLogged => switch (this) {
        SignupStateSuccess(user: var _) => true,
        _ => false,
      };
}
