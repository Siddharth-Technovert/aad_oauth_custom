import '../enums/account_type.dart';
import '../models/user/user.dart';
import '../states/user/user_state.dart';

abstract class UserRepository {
  Future<UserState> readUser();
  Future<UserState> createUser(String token, AccountType accountType);
  Future<UserState> createGuestUser(String name);
  Future<bool> updateUser(User user);
  Future<void> removeUser();
}
