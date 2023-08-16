import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/errors/app_exception.dart';
import '../../enums/account_type.dart';
import '../../models/user/user.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const SignupState._();
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading(AccountType accountType) = _Loading;
  const factory SignupState.success(User user) = _Success;
  const factory SignupState.error(AppException ex) = _Error;

  User? get user => maybeWhen(
        success: (user) => user,
        orElse: () => null,
      );

  bool get isLogged => maybeWhen(
        success: (user) => true,
        orElse: () => false,
      );
}
