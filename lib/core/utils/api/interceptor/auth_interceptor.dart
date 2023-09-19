import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInterceptor extends Interceptor {
  // ignore: unused_field
  final Ref _ref;
  AuthInterceptor(this._ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //TODO Update this if bearer token needs to be sent
    // if (!options.path.contains('/login')) {
    //   final token = await _ref.read(secureStorageManagerProvider).getAsync(
    //         key: AppConstants.tokenKey,
    //       );
    //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }
    handler.next(options);
  }
}
