import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/states/core/app_state.dart';
import '../../../domain/states/user_state.dart';
import '../../../domain/usecases/user/user_usecases.dart';
import '../../ui/modals/snack_bar/snack_bar_factory.dart';
import 'app_state_provider.dart';

part 'user_state_provider.g.dart';

@Riverpod(keepAlive: true)
class UserStateNotifier extends _$UserStateNotifier {
  late final UpdateUser _updateUserUseCase =
      ref.watch(updateUserUseCaseProvider);

  @override
  UserState build() {
    return switch (ref.watch(appStateNotifierProvider)) {
      AppStateAuthenticated(user: var user) => UserStateAvailable(user: user),
      _ => const UserStateNotAvailable()
    };
  }

  Future<void> updateUserImage(String path) async {
    if (state.user != null) {
      final updatedUser = state.user!.copyWith(profileImage: path);
      final isUpdated = await _updateUserUseCase(updatedUser);
      if (isUpdated) {
        state = UserStateAvailable(user: updatedUser);
      } else {
        SnackbarFactory.showError("Unable to update image");
      }
    }
  }

  Future<void> updateUserName(String name) async {
    if (state.user != null) {
      final updatedUser = state.user!.copyWith(name: name);
      final isUpdated = await _updateUserUseCase(updatedUser);

      if (isUpdated) {
        state = UserStateAvailable(user: updatedUser);
      } else {
        SnackbarFactory.showError("Unable to update name");
      }
    }
  }
}
