// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../core/configs/app_configuration.dart';
import '../../core/configs/constants/app_constants.dart';
import '../../core/utils/errors/app_exception.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/models/user_context/user_context.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/states/login/login_state.dart';
import '../data_source/local/storage_manager.dart';
import '../models/result/data_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final StorageManager _storageManager;
  AuthRepositoryImpl(this._storageManager);

  @override
  Future<LoginState> login(AccountType accountType) async {
    DataState<UserContext> dataState;
    switch (accountType) {
      case AccountType.facebook:
        dataState = await _signInWithFacebook();
        break;
      case AccountType.google:
        dataState = await _signInWithGoogle();
        break;
      case AccountType.guest:
      default:
        dataState = await _signInAsGuest();
        break;
    }
    return dataState.when(
      success: (data) => LoginState.success(data),
      error: (ex) => LoginState.error(ex.msg),
    );
  }

  @override
  Future<LoginState> guestLogin(String name) async {
    try {
      final user = UserContext(
        id: 'guest',
        displayName: name,
        accountType: AccountType.guest,
      );
      await _storageManager.writeStringAsync(
        key: AppConstants.tokenKey,
        value: "guest-token",
      );
      return LoginState.success(user);
    } catch (ex) {
      return LoginState.error(AppException.unknownError(ex.toString()).msg);
    }
  }

  @override
  Future<void> logout(AccountType accountType) async {
    switch (accountType) {
      case AccountType.google:
        await AppConfiguration.googleSignIn
            .signOut(); // disconnects the user from app and revokes all permissions, signOut just marks the user as being in signed out stage.
        break;
      case AccountType.facebook:
        await AppConfiguration.facebookLogin.logOut();
        break;
      case AccountType.guest:
        break;
      default:
        break;
    }
  }

  Future<DataState<UserContext>> _signInAsGuest() async {
    try {
      const user = UserContext(
        accountType: AccountType.guest,
      );
      await _storageManager.writeStringAsync(
        key: AppConstants.tokenKey,
        value: "guest-token",
      );
      return const DataState.success(user);
    } catch (ex) {
      return DataState.error(AppException.unknownError(ex.toString()));
    }
  }

  Future<DataState<UserContext>> _signInWithFacebook() async {
    try {
      final result = await AppConfiguration.facebookLogin.login(
        loginBehavior: LoginBehavior
            .webOnly, //TODO Update this to use any login behavior (its temporary for now)
      );
      if (result.status == LoginStatus.success) {
        final profile = await AppConfiguration.facebookLogin.getUserData();

        //TODO Call server to save the credential and create session

        final UserContext user = UserContext(
          displayName: profile['name'].toString(),
          id: profile["email"].toString(),
          profileImage: profile['picture']['data']['url'].toString(),
          accountType: AccountType.facebook,
        );

        await _storageManager.writeStringAsync(
          key: AppConstants.tokenKey,
          value: result.accessToken!.token,
        );

        return DataState.success(user);
      } else if (result.status == LoginStatus.cancelled) {
        return const DataState.error(
          AppException.unknownError('Login cancelled by the user.'),
        );
      } else {
        return DataState.error(
          AppException.unknownError(
            'Something went wrong with the login process.\n'
            "Here's the error Facebook gave us: ${result.message}",
          ),
        );
      }
    } catch (ex) {
      return DataState.error(AppException.unknownError(ex.toString()));
    }
  }

  Future<DataState<UserContext>> _signInWithGoogle() async {
    try {
      final result = await AppConfiguration.googleSignIn.signIn();
      if (result != null) {
        final googleKey = await result.authentication;
        if (AppConfiguration.googleSignIn.currentUser != null) {
          final currentUser = AppConfiguration.googleSignIn.currentUser;

          //TODO Call server to save the credential and create session

          final UserContext user = UserContext(
            displayName: currentUser!.displayName,
            id: currentUser.email,
            profileImage: currentUser.photoUrl,
            accountType: AccountType.google,
          );

          await _storageManager.writeStringAsync(
            key: AppConstants.tokenKey,
            value: googleKey.accessToken!,
          );

          return DataState.success(user);
        } else {
          return const DataState.error(
            AppException.unknownError('Google sign in failed'),
          );
        }
      } else {
        return const DataState.error(
          AppException.unknownError('Login cancelled by the user.'),
        );
      }
    } catch (ex) {
      return DataState.error(AppException.unknownError(ex.toString()));
    }
  }
}
