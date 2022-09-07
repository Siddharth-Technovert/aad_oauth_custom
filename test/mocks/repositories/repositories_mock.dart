import 'package:mockito/annotations.dart';
import 'package:riverpod_boilerplate/domain/repositories/auth_repository.dart';
import 'package:riverpod_boilerplate/domain/repositories/user_repository.dart';

@GenerateMocks(
  [
    AuthRepository,
    UserRepository,
  ],
)
Future<void> main() async {}
