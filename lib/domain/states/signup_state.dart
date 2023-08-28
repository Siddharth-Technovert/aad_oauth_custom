import '../../core/utils/errors/app_exception.dart';
import '../enums/account_type.dart';
import '../models/user/user.dart';

sealed class SignupState {}

class SignupStateInitial implements SignupState {
  const SignupStateInitial();
}

class SignupStateLoading implements SignupState {
  const SignupStateLoading({required this.accountType});
  final AccountType accountType;
}

class SignupStateSuccess implements SignupState {
  const SignupStateSuccess({required this.user});
  final User user;
}

class SignupStateError implements SignupState {
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