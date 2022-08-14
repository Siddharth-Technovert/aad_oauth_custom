import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user_context/user_context.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(UserContext userContext) = _Success;
  const factory LoginState.error(String message) = _Error;

  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );

  UserContext? get userContext => maybeMap(
        success: (_) => _.userContext,
        orElse: () => null,
      );
}
