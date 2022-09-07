import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/account_type.dart';
import '../../models/user/user.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading(AccountType accountType) = _Loading;
  const factory LoginState.success(User user) = _Success;
  const factory LoginState.error(String message) = _Error;

  User? get user => maybeWhen(
        success: (user) => user,
        orElse: () => null,
      );
}
