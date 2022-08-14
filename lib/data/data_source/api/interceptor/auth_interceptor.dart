import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/configs/constants/app_constants.dart';
import '../../local/storage_manager.dart';

class AuthInterceptor extends Interceptor {
  final StorageManager _storageManager;
  AuthInterceptor(this._storageManager);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.path.contains('/login')) {
      final token = await _storageManager.readStringAsync(
        key: AppConstants.tokenKey,
      );
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    handler.next(options);
  }
}
