import '../enums/account_type.dart';
import '../states/login/login_state.dart';

abstract class AuthRepository {
  Future<LoginState> login(AccountType accountType);
  Future<void> logout(AccountType accountType);
  Future<LoginState> guestLogin(String name);
}
