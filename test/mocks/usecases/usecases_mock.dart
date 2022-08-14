import 'package:mockito/annotations.dart';
import 'package:riverpod_boilerplate/domain/usecases/auth/auth_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/theme/theme_storage_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/user_context/user_context_usecases.dart';

@GenerateMocks(
  [
    LoginUser,
    LogoutUser,
    ReadTheme,
    WriteTheme,
    ReadUserContext,
    WriteUserContext,
    RemoveUserContext
  ],
)
Future<void> main() async {}
