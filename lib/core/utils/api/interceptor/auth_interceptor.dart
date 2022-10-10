import 'dart:io';

import 'package:dio/dio.dart';

import '../../local_storage/secure/secure_storage_manager.dart';
import '../../../utils/constants/app_constants.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageManager _secureStorageManager;
  AuthInterceptor(this._secureStorageManager);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.path.contains('/login')) {
      final token = await _secureStorageManager.getAsync(
        key: AppConstants.tokenKey,
      );
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    handler.next(options);
  }
}
