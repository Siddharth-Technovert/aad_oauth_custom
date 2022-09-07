import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/account_type.dart';
import '../../models/user/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const UserState._();
  const factory UserState.available(User user) = _Available;
  const factory UserState.notAvailable() = _NotAvailable;

  User? get user => maybeWhen(
        available: (user) => user,
        orElse: () => null,
      );

  bool get isSocialLoggedIn => maybeWhen(
        available: (user) => user.accountType != AccountType.guest,
        orElse: () => false,
      );
}
