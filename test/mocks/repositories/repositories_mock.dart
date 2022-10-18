import 'package:massy_stores/domain/repositories/auth_repository.dart';
import 'package:massy_stores/domain/repositories/user_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AuthRepository,
    UserRepository,
  ],
)
Future<void> main() async {}
