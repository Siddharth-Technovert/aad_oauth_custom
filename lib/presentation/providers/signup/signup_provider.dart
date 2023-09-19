import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/data_service_providers.dart';
import '../../../domain/enums/account_type.dart';
import '../../../domain/states/signup_state.dart';

part 'signup_provider.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignupState build() {
    return const SignupStateInitial();
  }

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
    ref.read(loggerServiceProvider);
  }
}
