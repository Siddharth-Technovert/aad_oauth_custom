import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/utils/errors/app_exception.dart';
import '../../domain/enums/account_type.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/states/login/login_state.dart';
import '../data_source/api/response/api_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserRepository _userRepository;
  AuthRepositoryImpl(this._userRepository);

  //TODO google client id "<ADD YOUR CLIENT ID>"
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  //TODO IMPLEMENT CONFIGURATIONS ON FACEBOOK DEVELOPER WEBSITE
  final FacebookAuth facebookLogin = FacebookAuth.instance;

  @override
  Future<LoginState> login(AccountType accountType) async {
    ApiResponse<String>? accessTokenState;

    switch (accountType) {
      case AccountType.facebook:
        accessTokenState = await _signInWithFacebook();
        break;
      case AccountType.google:
        accessTokenState = await _signInWithGoogle();
        break;
      case AccountType.guest:
        return guestLogin("Guest User");
      default:
        break;
    }
    return accessTokenState == null
        ? const LoginState.error("Some error")
        : accessTokenState.when(
            success: (token) async {
              final userState =
                  await _userRepository.createUser(token, accountType);
              return userState.when(
                available: (data) => LoginState.success(data),
                notAvailable: () =>
                    const LoginState.error("Unable to create user"),
              );
            },
            error: (ex) => LoginState.error(ex.msg),
          );
  }

  @override
  Future<LoginState> guestLogin(String name) async {
    try {
      final userState = await _userRepository.createGuestUser(name);
      return userState.when(
        available: (data) => LoginState.success(data),
        notAvailable: () => const LoginState.error("Unable to create user"),
      );
    } catch (ex) {
      return LoginState.error(AppException.unknownError(ex.toString()).msg);
    }
  }

  @override
  Future<void> logout(AccountType accountType) async {
    await _userRepository.removeUser();
    switch (accountType) {
      case AccountType.google:
        await googleSignIn
            .signOut(); // disconnects the user from app and revokes all permissions, signOut just marks the user as being in signed out stage.
        break;
      case AccountType.facebook:
        await facebookLogin.logOut();
        break;
      case AccountType.guest:
        break;
    }
  }

  Future<ApiResponse<String>> _signInWithFacebook() async {
    try {
      final result = await facebookLogin.login(
        loginBehavior: LoginBehavior
            .webOnly, //TODO Update this to use any login behavior (its temporary for now)
      );
      if (result.status == LoginStatus.success) {
        return ApiResponse.success(result.accessToken!.token);
      } else if (result.status == LoginStatus.cancelled) {
        return const ApiResponse.error(
          AppException.unknownError('Login cancelled by the user.'),
        );
      } else {
        return ApiResponse.error(
          AppException.unknownError(
            'Something went wrong with the login process.\n'
            "Here's the error Facebook gave us: ${result.message}",
          ),
        );
      }
    } catch (ex) {
      return ApiResponse.error(AppException.unknownError(ex.toString()));
    }
  }

  Future<ApiResponse<String>> _signInWithGoogle() async {
    try {
      final result = await googleSignIn.signIn();
      if (result != null) {
        final googleKey = await result.authentication;
        return ApiResponse.success(googleKey.accessToken!);
      } else {
        return const ApiResponse.error(
          AppException.unknownError('Login cancelled by the user.'),
        );
      }
    } catch (ex) {
      return ApiResponse.error(AppException.unknownError(ex.toString()));
    }
  }
}
