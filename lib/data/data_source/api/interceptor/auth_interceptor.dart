import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/configs/constants/app_constants.dart';
import '../../local/secure_storage/secure_storage_manager.dart';

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
