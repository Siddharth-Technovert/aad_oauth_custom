import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user_context/user_context.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();
  const factory AppState.initial() = _Initial;
  const factory AppState.unAuthenticated() = _UnAuthenticated;
  const factory AppState.authenticated(UserContext userContext) =
      _Authenticated;
}
