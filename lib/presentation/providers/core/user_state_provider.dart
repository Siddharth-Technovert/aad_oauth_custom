import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/states/core/app_state.dart';
import '../../../domain/states/user_state.dart';
import '../../../domain/usecases/user/user_usecases.dart';
import 'app_state_provider.dart';

final userStateProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userState = switch (ref.watch(appStateProvider)) {
    AppStateAuthenticated(user: var user) => UserStateAvailable(user: user),
    _ => const UserStateNotAvailable()
  };
  return UserNotifier(ref, userState);
});

class UserNotifier extends StateNotifier<UserState> {
  final Ref _ref;
  late final UpdateUser _updateUserUseCase =
      _ref.watch(updateUserUseCaseProvider);

  UserNotifier(this._ref, UserState userState) : super(userState) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> updateUserImage(String path) async {
    if (state.user != null) {
      final updatedUser = state.user!.copyWith(profileImage: path);
      final isUpdated = await _updateUserUseCase(updatedUser);
      if (isUpdated) {
        state = UserStateAvailable(user: updatedUser);
      } else {
        // Fluttertoast.showToast(msg: "Unable to update image");
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
        // Fluttertoast.showToast(msg: "Unable to update name");
      }
    }
  }
}
