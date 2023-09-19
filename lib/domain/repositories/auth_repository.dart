import '../../data/models/result/data_state.dart';
import '../enums/account_type.dart';
import '../models/user/user.dart';

abstract interface class AuthRepository {
  Future<DataState<User>> login(AccountType accountType);
  Future<void> logout(AccountType accountType);
}
