import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/states/user/user_state.dart';
import '../../../domain/usecases/user/user_usecases.dart';
import 'app_state_provider.dart';

final userStateProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userState = ref.watch(appStateProvider).maybeWhen(
        orElse: () => const UserState.notAvailable(),
        authenticated: (user) => UserState.available(user),
      );
  return UserNotifier(ref, userState);
});

class UserNotifier extends StateNotifier<UserState> {
  final Ref _ref;
  late final UpdateUser _updateUserUseCase =
      _ref.read(updateUserUseCaseProvider);

  UserNotifier(this._ref, UserState userState) : super(userState) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> updateUserImage(String path) async {
    if (state.user != null) {
      final updatedUser = state.user!.copyWith(profileImage: path);
      final isUpdated = await _updateUserUseCase(updatedUser);
      if (isUpdated) {
        state = UserState.available(updatedUser);
      } else {
        Fluttertoast.showToast(msg: "Unable to update image");
      }
    }
  }

  Future<void> updateUserName(String name) async {
    if (state.user != null) {
      final updatedUser = state.user!.copyWith(name: name);
      final isUpdated = await _updateUserUseCase(updatedUser);

      if (isUpdated) {
        state = UserState.available(updatedUser);
      } else {
        Fluttertoast.showToast(msg: "Unable to update name");
      }
    }
  }
}
