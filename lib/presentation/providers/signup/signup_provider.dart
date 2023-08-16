import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_service_providers.dart';
import '../../../domain/enums/account_type.dart';
import '../../../domain/states/signup/signup_state.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, SignupState>((ref) {
  return SignUpNotifier(ref);
});

class SignUpNotifier extends StateNotifier<SignupState> {
  // late final LoginRequest loginRequestInstance;
  SignupState get currentState => state;

  final Ref _ref;
  // late final SignupUser _signupUserUseCase =
  //     _ref.watch(signupUserUseCaseProvider);

  SignUpNotifier(this._ref) : super(const SignupState.initial()) {
    _init();
  }

  Future<void> _init() async {}

  Future<void> signUp(
    BuildContext context,
    AccountType accountType, {
    required bool isSignInButton,
    required String cardNumber,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    _ref.read(loggerServiceProvider);
  }
}
