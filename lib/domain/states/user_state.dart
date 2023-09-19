import '../enums/account_type.dart';
import '../models/user/user.dart';

sealed class UserState {}

class UserStateAvailable implements UserState {
  const UserStateAvailable({required this.user});
  final User user;
}

class UserStateNotAvailable implements UserState {
  const UserStateNotAvailable();
}

extension UserStateExtension on UserState {
  User? get user => switch (this) {
        UserStateAvailable(user: var user) => user,
        UserStateNotAvailable() => null,
      };

  bool get isSocialLoggedIn => switch (this) {
        UserStateAvailable(user: var user) =>
          user.accountType != AccountType.guest,
        UserStateNotAvailable() => false,
      };
}
