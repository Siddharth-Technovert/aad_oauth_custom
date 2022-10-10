import 'package:mockito/annotations.dart';
import 'package:riverpod_boilerplate/domain/usecases/auth/auth_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/onboarding/onboarding_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/storage/theme/theme_storage_usecases.dart';
import 'package:riverpod_boilerplate/domain/usecases/user/user_usecases.dart';

@GenerateMocks(
  [
    LoginUser,
    LogoutUser,
    ReadUser,
    UpdateUser,
    ReadTheme,
    WriteTheme,
    ReadOnboarding,
    WriteOnboarding,
  ],
)
Future<void> main() async {}
