import '../../data/models/result/data_state.dart';
import '../enums/account_type.dart';
import '../models/user/user.dart';

abstract interface class UserRepository {
  Future<DataState<User>> readUser();
  Future<DataState<User>> createUser(String token, AccountType accountType);
  Future<bool> updateUser(User user);
  Future<void> removeUser();
}
