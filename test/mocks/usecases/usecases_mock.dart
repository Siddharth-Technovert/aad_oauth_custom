import 'package:mockito/annotations.dart';
import 'package:riverpod_boilerplate/app/domain/usecases/onboarding/onboarding_usecases.dart';
import 'package:riverpod_boilerplate/feature/auth/domain/usecases/auth/auth_usecases.dart';
import 'package:riverpod_boilerplate/feature/auth/domain/usecases/user/user_usecases.dart';
import 'package:riverpod_boilerplate/shared/domain/usecases/theme/theme_storage_usecases.dart';

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
