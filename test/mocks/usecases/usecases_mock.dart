import 'package:massy_stores/domain/usecases/auth/auth_usecases.dart';
import 'package:massy_stores/domain/usecases/storage/onboarding/onboarding_usecases.dart';
import 'package:massy_stores/domain/usecases/storage/theme/theme_storage_usecases.dart';
import 'package:massy_stores/domain/usecases/user/user_usecases.dart';
import 'package:mockito/annotations.dart';

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
